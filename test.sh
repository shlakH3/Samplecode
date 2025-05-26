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
