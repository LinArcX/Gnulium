#pragma once

#define HISTOGRAM "varName=someValue; if [[ $SHELL == *'zsh'* ]] ; then varName=~/'.zhistory'; elif [[ $SHELL == *'bash'* ]]; then varName=~/'.bash_history'; fi; cat $varName | cut -d';' -f2  | awk '{h[$1]++}END{for(i in h){print h[i],i|\"sort -rn|head -10\"}}' | tac"
    // varName=someValue; if [[ $SHELL == *'zsh'* ]] ; then varName=~/'.zhistory'; elif [[ $SHELL == *'bash'* ]]; then varName=~/'.bash_history'; fi; cat $varName | cut -d';' -f2  | awk '{h[$1]++}END{for(i in h){print h[i],i|"sort -rn|head -20"}}'

#define SD "iwgetid -r; cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address"


