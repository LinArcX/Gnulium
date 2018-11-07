#pragma once

// SystemD-Analyze
#define KERNEL_TIME "echo \"Kernel=$(systemd-analyze | head -n1 | cut -d\" \" -f4)\""
#define USERSPACE_TIME "echo \"UserSpace=$(systemd-analyze | head -n1 | awk '{print $7}')\""
#define TOTAL_TIME "echo \"Total=$(systemd-analyze | head -n1 | cut -d\"=\" -f2)\";"
// Date And Time
#define CURRENT_TIME "date +\"%H:%M %p\""
#define GREGORIAN_DATE "date +%A,' '%d' '%B,' '%Y"
#define PERSIAN_DATE "jdate +%G' '%d' '%V' '%Y"
// System Info
#define ARCH_AGE "todaySecond=$(date -d \"$date\" +\"%s\");installTime=$(cat /var/log/pacman.log | head -1 | cut -d\"]\" -f1 | cut -d\"[\" -f2 |  awk '{print $1}');installTimeSecond=$(date -d \"$installTime\" +\"%s\");ageSecond=$((todaySecond - installTimeSecond));alldays=$((ageSecond / 86400 ));monthfirst=$((alldays/30));year=$((monthfirst/12));month=$((monthfirst%12));day=$((alldays%30));echo \"$year year,$month month,$day day\";"
#define UP_TIME "uptime -p | sed -e 's/^\\w*\\ *//'"
#define VGA "lspci | grep VGA | awk '{ print $5}' | tr \"\n\" \" \""
#define TOR_STATUS "systemctl status tor.service"

#define TOP_MEMORY "ps -Ao pid,comm,pmem --sort=-pmem | head -n 11"
#define TOP_CPU "ps -Ao pid,comm,pcpu --sort=-pcpu | head -n 11"
#define NET "iwgetid -r; cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address"

//echo "Date=$(date +"%H:%M%p" )";echo "DateGMT=$(date -u +"%H:%M%p")";echo "DateDesc=$(date +%A,' '%d' '%B,' '%Y)";echo "DatePersian=$(jdate +%G' '%d' '%V','%Y|fribidi --ltr)";
//date +"%H:%M%p"; date -u +"%H:%M%p"; date +%A,' '%d' '%B,' '%Y; jdate +%G' '%d' '%V','%Y|fribidi --ltr;

// ((\d)+\.?([\dkmgKGM%])*)|(\/([\w\d\-\/])*)|([a-zA-z]+ [a-zA-Z]+)|((\w+-)+\w+)|(\w+)
// link: https://regex101.com/r/VKsGMs/1

// select until new line: (?<=\n\n)(.*)(?=\n\n)
// distint words with only one tab: (\S*?)(\s|$) or .+?(?=\s|$)
// get all words: (\S*)(\s*)

//systemd-analyze | head -n1 | cut -d" " -f4;systemd-analyze | head -n1 | cut -d" " -f7 ;systemd-analyze | head -n1 | cut -d" " -f10;

//todaySecond=$(date -d "$date" +"%s");installTime=$(ls -ld /lost+found | awk '{print $6, $7, $8}');installTimeSecond=$(date -d "$installTime" +"%s") ;ageSecond=$((todaySecond - installTimeSecond));alldays=$((ageSecond / 86400 ));monthfirst=$((alldays/30));year=$((monthfirst/12));month=$((monthfirst%12));day=$((alldays%30));echo "$year year,$month month,$day day";

//todaySecond=$(date -d "$date" +"%s");installTime=$(cat /var/log/pacman.log | head -1 | cut -d"]" -f1 | cut -d"[" -f2 |  awk '{print $1}');installTimeSecond=$(date -d "$installTime" +"%s");ageSecond=$((todaySecond - installTimeSecond));alldays=$((ageSecond / 86400 ));monthfirst=$((alldays/30));year=$((monthfirst/12));month=$((monthfirst%12));day=$((alldays%30));echo "$year year,$month month,$day day";

//uname -o; uname -r; uname -n; uname -m; echo $SHELL; echo $LANG; echo $EDITOR; echo $PAGER; echo $XDG_CURRENT_DESKTOP; echo $QT_QPA_PLATFORMTHEME; echo $DISPLAY;[ -d /sys/firmware/efi ] && echo UEFI || echo BIOS; echo $(lspci | grep VGA | cut -d" " -f5 | sed ':a;N;$!ba;s/\n/+/g'); echo $(xrandr --listproviders | awk '{print $(NF)}' | tail -2 | sed ':a;N;$!ba;s/\n/+/g' | sed -e 's/name://g');systemctl list-units -t service --all | wc -l; systemctl list-units -t service --failed | wc -l;lsmod | wc -l;

//echo "OS:$(uname -o)"; echo "Kernel:$(uname -r)"; echo "UserName:$(uname -n)"; echo "Arch:$(uname -m)";  echo "Shell:$(echo $SHELL)"; echo "Language:$(echo $LANG)"; echo "Editor:$(echo $EDITOR)"; echo "Pager:$(echo $PAGER)"; echo "DE:$(echo $XDG_CURRENT_DESKTOP)"; echo "Qt.ver:$(echo $QT_QPA_PLATFORMTHEME)"; echo "Display:$(echo $DISPLAY)"; echo "Bios/UEFI:$([ -d /sys/firmware/efi ] && echo UEFI || echo BIOS)"; echo "VGAs:$(echo $(lspci | grep VGA | cut -d" " -f5 | sed ':a;N;$!ba;s/\n/+/g'))"; echo "VGA.Drivers:$(echo $(xrandr --listproviders | awk '{print $(NF)}' | tail -2 | sed ':a;N;$!ba;s/\n/+/g' | sed -e 's/name://g'))"; echo "All Services:$(systemctl list-units -t service --all | wc -l)"; echo "Failed:$(systemctl list-units -t service --failed | wc -l)"; echo "Kernel Modules:$(lsmod | wc -l)";

//echo \"VGAs:$(echo $(lspci | grep VGA | cut -d" " -f5 | sed ':a;N;$!ba;s/\n/+/g'))\"; echo \"VGA.Drivers:$(echo $(xrandr --listproviders | awk '{print $(NF)}' | tail -2 | sed ':a;N;$!ba;s/\n/+/g' | sed -e 's/name://g'))\";
