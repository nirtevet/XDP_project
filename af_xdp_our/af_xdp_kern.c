/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/bpf.h>
#include <linux/if_xdp.h>
#include <linux/in.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <linux/udp.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>
#include <linux/kernel.h>
#include "../common/parsing_helpers.h"
#include "../common/xdp_stats_kern_user.h"
#include "../common/xdp_stats_kern.h"



struct {
    __uint(type, BPF_MAP_TYPE_XSKMAP);
    __type(key, __u32);
    __type(value, __u32);
    __uint(max_entries, 64);
} xsks_map SEC(".maps");

struct {
    __uint(type, BPF_MAP_TYPE_HASH);
    __type(key, struct Key);
    __type(value, __u32);
    __uint(max_entries, 64);
} xdp_filter_map SEC(".maps");

struct Key {
    __u32 ip_addr;
    __u8 ipv6_addr[16];
    __u16 port_num;
};

SEC("xdp")
int xdp_sock_prog(struct xdp_md *ctx)
{
    struct Key key = {};
    struct hdr_cursor nh;
    struct ethhdr *eth = NULL;
    struct iphdr *iphdr = NULL;
    struct ipv6hdr *ipv6hdr = NULL;
    int eth_type, ip_type;

    nh.pos = (void *)(long)ctx->data;
	bpf_trace_printk("%d",2);
	/*bpf_trace_printk("Key: ip_addr=%u, ipv6_addr=%02x:%02x:...:%02x:%02x, port_num=%u\n",
           key.ip_addr,
           key.ipv6_addr[0],
           key.ipv6_addr[1],
           key.ipv6_addr[14],
           key.ipv6_addr[15],
           key.port_num);
*/

    eth_type = parse_ethhdr(&nh, (void *)(long)ctx->data_end, &eth);
    if (eth_type == -1)
        return XDP_PASS;

    if (eth_type == bpf_htons(ETH_P_IP)) {
        ip_type = parse_iphdr(&nh, (void *)(long)ctx->data_end, &iphdr);
        if (ip_type == -1)
            return XDP_PASS;

        key.ip_addr = iphdr->saddr;
    } else if (eth_type == bpf_htons(ETH_P_IPV6)) {
        ip_type = parse_ip6hdr(&nh, (void *)(long)ctx->data_end, &ipv6hdr);
        if (ip_type == -1)
            return XDP_PASS;

        // Copy the IPv6 address into the key
        for (int i = 0; i < 16; i++) {
            key.ipv6_addr[i] = ipv6hdr->saddr.in6_u.u6_addr8[i];
        }
    } else {
        return XDP_PASS;
    }

    // Print the key for debugging
	bpf_printk("Key: ip_addr=%u, ipv6_addr=", key.ip_addr);

	for (int i = 0; i < 16; i++) {
		bpf_printk("%02x", key.ipv6_addr[i]);
		if (i < 15) {
			bpf_printk(":");
		}
	}

	bpf_printk(", port_num=%u\n", key.port_num);


    // Use bpf_map_lookup_elem to look up the element in the map
    __u32 *action = bpf_map_lookup_elem(&xdp_filter_map, &key);
    if (!action)
        return XDP_PASS;

    if (*action == XDP_REDIRECT)
        return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, 0);

    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
