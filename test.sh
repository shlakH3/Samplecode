#!/bin/bash

# Nmapログファイル名
LOGFILE="test.log"

awk '
BEGIN {
    ip = "";
    open_ports = 0;
}
/^Nmap scan report for/ {
    if (ip != "") {
        print ip ": " open_ports " open port(s)";
    }
    ip = $5;
    open_ports = 0;
}
/^[0-9]+\/udp/ {
    if ($2 == "open") {
        open_ports++;
    }
}
END {
    if (ip != "") {
        print ip ": " open_ports " open port(s)";
    }
}
' "$LOGFILE"




ubuntu@ubuntu-1:~/Desktop$ cat test.log
# Nmap 7.80 scan initiated Mon May 26 22:23:19 2025 as: nmap -sU -P0 -p 0-500 -n -T4 --max-parallelism 10 --max-retries 0 --max-rtt-timeout 200ms --initial-rtt-timeout 200ms -oN test.log -iL targets.txt
Warning: 192.168.30.254 giving up on port because retransmission cap hit (0).
Nmap scan report for 192.168.30.254
Host is up.
All 501 scanned ports on 192.168.30.254 are open|filtered

Warning: 192.168.0.1 giving up on port because retransmission cap hit (0).
Warning: 192.168.0.100 giving up on port because retransmission cap hit (0).
Nmap scan report for 192.168.0.100
Host is up (0.00083s latency).
Not shown: 500 open|filtered ports
PORT    STATE SERVICE
137/udp open  netbios-ns
MAC Address: 4C:B0:4A:81:D4:77 (Unknown)

Nmap scan report for 192.168.0.1
Host is up (0.0040s latency).
Not shown: 484 open|filtered ports
PORT    STATE  SERVICE
14/udp  closed unknown
29/udp  closed msg-icp
42/udp  closed nameserver
89/udp  closed su-mit-tg
158/udp closed pcmail-srv
161/udp closed snmp
201/udp closed at-rtmp
213/udp closed ipx
221/udp closed fln-spx
247/udp closed subntbcst_tftp
269/udp closed manet
291/udp closed unknown
313/udp closed magenta-logic
415/udp closed bnet
440/udp closed sgcp
457/udp closed scohelp
484/udp closed integra-sme
MAC Address: BC:5C:4C:A1:E7:E9 

# Nmap done at Mon May 26 22:23:40 2025 -- 3 IP addresses (3 hosts up) scanned in 21.60 seconds
