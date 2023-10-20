/* SPDX-License-Identifier: GPL-2.0 */

#include <linux/bpf.h>
#include <linux/if_xdp.h>
#include <bpf/bpf_helpers.h>
#include <linux/in.h>
#include <stdlib.h>
#include <stdio.h>
#include <bpf/bpf_endian.h>
#include <stdint.h>



#include "../common/parsing_helpers.h"

/* Defines xdp_stats_map */
#include "../common/xdp_stats_kern_user.h"
#include "../common/xdp_stats_kern.h"


struct {
	__uint(type, BPF_MAP_TYPE_XSKMAP);
	__type(key, __u32);
	__type(value, __u32);
	__uint(max_entries, 64);
} xsks_map SEC(".maps");
/*
struct {
	__uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
	__type(key, __u32);
	__type(value, __u32);
	__uint(max_entries, 64);
} xdp_stats_map SEC(".maps");
*/

struct Key {
    __u32 ip_addr;
    //struct in6_addr ipv6_addr;
	__u64 ipv6_addr;
    __u16 port_num;
};

struct Value{
	int action;
};


struct {
	__uint(type, BPF_MAP_TYPE_HASH);
	__type(key, struct Key);
	__type(value, __u32);
	//__type(value, struct Value);
	__uint(max_entries, 64);    //maybe need to be adjusted
} xdp_filter_map SEC(".maps");



SEC("xdp")
int xdp_sock_prog(struct xdp_md *ctx)
{

	//struct Value value = {0}; // Define a local struct Value variable
	int* action;
	int default_action = XDP_PASS;
	//value.action = XDP_REDIRECT;
	action = &default_action;


    struct Key key = {0};

    int index = ctx->rx_queue_index; //if only one rx

    void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct hdr_cursor nh;
	struct ethhdr *eth = NULL;
    struct iphdr *iphdr = NULL;
    struct ipv6hdr *ipv6hdr = NULL;
	int eth_type,ip_type;


	nh.pos = data;
	//goto out;

	eth_type = parse_ethhdr(&nh, data_end, &eth);
	if (eth_type == -1)
		goto out;
    
    if (eth_type == bpf_htons(ETH_P_IP)) {
		ip_type = parse_iphdr(&nh, data_end, &iphdr);
		if (ip_type == -1)
			goto out;
        else{
            key.ip_addr = iphdr->saddr;
			goto out; ///////////
        }
	} 
    else if (eth_type == bpf_htons(ETH_P_IPV6)) {
		ip_type = parse_ip6hdr(&nh, data_end, &ipv6hdr);
		if (ip_type == -1)
			goto out;
        else{
            //key.ipv6_addr = ipv6hdr->saddr;
			//return XDP_PASS;
			key.ipv6_addr = *(uint64_t *) ipv6hdr ;
        }
	} else {
		goto out;
	}
	//struct Value* ret=NULL;
	// Do we know where to redirect this packet?

	//printk("\n\n\n%d\n,%d\n", key.ip_addr,key.port_num);
	//bpf_trace_printk("Key: %u\n", key.ipv6_addr.s6_addr32[0]);
	action = bpf_map_lookup_elem(&xdp_filter_map, &key);
	//printf("\n\n\n%d\n",*action);
    if(action == NULL){
        goto out;
		//return XDP_PASS;
    }
	//value = *ret;
    if(*action == XDP_REDIRECT){
        if (bpf_map_lookup_elem(&xsks_map, &index))
			//return XDP_PASS;
            return bpf_redirect_map(&xsks_map, index, 0);
    }

out:
	//return xdp_stats_record_action(ctx, *action);
	return 	bpf_redirect_map(&xsks_map, index, 0);
	//return XDP_PASS;
}
   


char _license[] SEC("license") = "GPL";
