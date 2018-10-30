#pragma once

#define HISTOGRAM "varName=someValue; if [[ $SHELL == *'zsh'* ]] ; then varName=~/'.zhistory'; elif [[ $SHELL == *'bash'* ]]; then varName=~/'.bash_history'; fi; cat $varName | cut -d';' -f2  | awk '{h[$1]++}END{for(i in h){print h[i],i|\"sort -rn|head -10\"}}' | tac"
    // varName=someValue; if [[ $SHELL == *'zsh'* ]] ; then varName=~/'.zhistory'; elif [[ $SHELL == *'bash'* ]]; then varName=~/'.bash_history'; fi; cat $varName | cut -d';' -f2  | awk '{h[$1]++}END{for(i in h){print h[i],i|"sort -rn|head -20"}}'

#define SD "iwgetid -r; cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address"


#define ACTIVE_SERVICES "systemctl -t service --state=running | tail -n +2 | head -n -7 | awk -v ORS= '{print $1\"\t\"$2\"\t\"$3\"\t\"$4\"\t\"$5; for(i=6;i<=NF;i++) print (i%1?OFS:\"_\") $i; print (\"\\n\")}' | awk '{ print $1\"\t\"$5}'"
