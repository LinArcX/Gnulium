#pragma once



#define NEXT_UPDATE_LIST "checkupdates | awk '{ print $1 }'"

#define NEXT_UPDATE_SIZE "yes n | pkexec pacman -Syyuu | grep \"Total Download\" | awk '{ print $4,$5 }'"

#define REPO_SUMMARY "echo \"AUR=$(pacman -Qem | wc -l)\"; echo \"Packages=$(pacman -Q | wc -l)\"; echo \"Apps=$(pacman -Qe | wc -l)\"; echo \"Orphans=$(pacman -Qdttq | wc -l)\"; echo \"PackageToBeUpdate=$(checkupdates | wc -l )\";"

#define LAST_UPGRADE_TIME "grep -a Syu /var/log/pacman.log | tail -1 | cut -d\"[\" -f2 | cut -d\"]\" -f1" //| cut -d" " -f1 | tr - / | xargs jdate '+%W' -j"

#define MY_AUR_HELPER "myHelpers; aur_helper=(\"apacman\" \"aura\" \"aurelaurget\" \"aurquery\" \"aurutils\" \"bauerbill\" \"burgaur\" \"cower\" \"pacaur\" \"packer\" \"pbget\" \"pkgbuilder\" \"prm\" \"trizen\" \"wrapaur\" \"yaah\" \"yaourt\"); for i in ${aur_helper[*]}; do if [ -f \"/usr/bin/$i\" ]; then myHelpers+=\"$i, \"; fi; done;  echo $myHelpers;" //echo \"$i\"

#define QUERY_FILE_DB(lib) "pacman -Fs "#lib"| grep '^\S' | sed '/error/,+1 d' | tr / \" \""

#define HISTOGRAM "varName=someValue; if [[ $SHELL == *'zsh'* ]] ; then varName=~/'.zhistory'; elif [[ $SHELL == *'bash'* ]]; then varName=~/'.bash_history'; fi; cat $varName | cut -d';' -f2  | awk '{h[$1]++}END{for(i in h){print h[i],i|\"sort -rn|head -10\"}}' | tac"

#define SD "iwgetid -r; cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address"

#define NAME "Name"
#define COMMENT "Comment"
#define FONT_SIZE "fontSize"
#define DE_PATH "~/.local/share/applications/"
