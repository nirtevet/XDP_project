#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <errno.h>
#include <linux/bpf.h>
#include <bpf/bpf.h>
#define KEY

struct Key {
    __u32 ip_addr;
    __u8 ipv6_addr[16];
    __u16 port_num;
};

void print_key(const struct Key *k) {
    printf("IPv4 Address: %u.%u.%u.%u\n",
           (k->ip_addr & 0xFF000000) >> 24,
           (k->ip_addr & 0x00FF0000) >> 16,
           (k->ip_addr & 0x0000FF00) >> 8,
           (k->ip_addr & 0x000000FF));

    printf("IPv6 Address: ");
    for (int i = 0; i < 16; i++) {
        printf("%02X", k->ipv6_addr[i]);
        if (i % 2 == 1 && i != 15) {
            printf(":");
        }
    }
    printf("\n");

    printf("Port Number: %u\n", k->port_num);
}

int config_file_parser(char* config_file_name, int filter_map_fd) {
    printf("\n\n\n123123123\n\n\n");
    const char *config_file = config_file_name;
    FILE *file = fopen(config_file, "r");
    if (file == NULL) {
        perror("Failed to open configuration file");
        return EXIT_FAILURE;
    }

    //int filter_map_fd; // You should have this file descriptor from your code

    char line[128];
    struct Key key={0};
    __u32 xdp_redirect = XDP_REDIRECT; // Value to be stored in the map

    while (fgets(line, sizeof(line), file)) {
        if (line[0] == '\n' || line[0] == '\0' || line[0] == '#') {
            // Skip empty lines or comments
            continue;
        }

        if (strncmp(line, "ip_list:", 8) == 0) {
            char *ip_str = strtok(line + 8, " \t\n");
            if (ip_str != NULL) {
                if (inet_pton(AF_INET, ip_str, &(key.ip_addr)) != 1) {
                    fprintf(stderr, "Invalid IPv4 address: %s\n", ip_str);
                    return EXIT_FAILURE;
                }
            }
        } else if (strncmp(line, "ipv6_list:", 10) == 0) {
            char *ipv6_str = strtok(line + 10, " \t\n");
            if (ipv6_str != NULL) {
                // Parse IPv6 address with "::" representing zero bytes
                if (strchr(ipv6_str, ':') != NULL) {
                    char expanded_ipv6[40]; // 8 groups * 4 characters + 7 colons + 1 null-terminator
                    int num_groups = sscanf(ipv6_str, "%[^:]:%[^:]:%[^:]:%[^:]:%[^:]:%[^:]:%[^:]:%s",
                                            expanded_ipv6, expanded_ipv6 + 5, expanded_ipv6 + 10,
                                            expanded_ipv6 + 15, expanded_ipv6 + 20, expanded_ipv6 + 25,
                                            expanded_ipv6 + 30, expanded_ipv6 + 35);

                    if (num_groups != 8) {
                        fprintf(stderr, "Invalid IPv6 address: %s\n", ipv6_str);
                        return EXIT_FAILURE;
                    }

                    for (int i = 0; i < 8; i++) {
                        if (inet_pton(AF_INET6, expanded_ipv6 + i * 5, key.ipv6_addr + i * 2) != 1) {
                            fprintf(stderr, "Invalid IPv6 address: %s\n", ipv6_str);
                            return EXIT_FAILURE;
                        }
                    }
                } else {
                    // No "::" found, treat it as a regular IPv6 address
                    if (inet_pton(AF_INET6, ipv6_str, key.ipv6_addr) != 1) {
                        fprintf(stderr, "Invalid IPv6 address: %s\n", ipv6_str);
                        return EXIT_FAILURE;
                    }
                }
            }
        } else if (strncmp(line, "port_list:", 10) == 0) {
            char *port_str = strtok(line + 10, " \t\n");
            if (port_str != NULL) {
                key.port_num = htons(atoi(port_str));
            }
        }
        
        print_key(&key);
        

        // Load the key and value into xdp_filter_map
        if (bpf_map_update_elem(filter_map_fd, &key, &xdp_redirect, BPF_ANY) != 0) {
            perror("bpf_map_update_elem");
            return EXIT_FAILURE;
        }
    }

    fclose(file);
    return EXIT_SUCCESS;
}
