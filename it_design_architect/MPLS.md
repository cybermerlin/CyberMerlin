---
layout: default
title: Multiprotocol Label Switching (MPLS)
---

[#devsecops](../../devsecops) [#it_design_architect](../)

## Multiprotocol Label Switching (MPLS)

 is a high-performance routing technique used in telecommunications and enterprise networks to direct data from one node to the next based on short labels rather than long network addresses. This avoids complex lookups in a routing table at every hop, speeding up traffic flow and improving overall network performance.
Key Concepts

* Layer 2.5 Protocol: MPLS operates between the Data Link layer (Layer 2) and the Network layer (Layer 3) of the OSI model.
* Multiprotocol: It is protocol-agnostic, meaning it can encapsulate and carry various types of traffic, including IPv4, IPv6, Ethernet, and older protocols like ATM or Frame Relay.
* Label-Switched Path (LSP): A predetermined, unidirectional path through the network that packets follow based on their labels.

**How It Works**
   1. Ingress: When a packet enters the MPLS network through an Ingress Label Edge Router (LER), it is assigned a label based on its destination and service requirements (the Forwarding Equivalence Class or FEC).
   2. Transit: Intermediate Label Switch Routers (LSRs) receive the labeled packet, swap the existing label for a new one defined for the next hop, and forward it along the LSP. This "label swapping" is much faster than traditional IP routing.
   3. Egress: At the final Egress LER, the label is "popped" (removed), and the original packet is forwarded to its final destination using standard IP routing.

**Primary Applications**
* Traffic Engineering (TE): Allows network administrators to steer traffic over specific paths to optimize bandwidth and avoid congestion.
* Virtual Private Networks (VPNs): Supports both L3VPN (IP-based) and L2VPN (Ethernet-based, such as VPLS), enabling secure, isolated communication across a shared infrastructure.
* Quality of Service (QoS): Labels can indicate traffic priority, ensuring that latency-sensitive applications like VoIP and video conferencing receive guaranteed bandwidth.

**Comparison with SD-WAN**
While MPLS provides highly reliable and predictable performance with clear Service Level Agreements (SLAs), it is often more expensive and less flexible than modern SD-WAN (Software-Defined Wide Area Network). Many organizations now use a hybrid approach, combining MPLS for critical traffic and broadband for general internet access.
