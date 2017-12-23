#include "launcher/presenter/launcher.h"
#include <QApplication>
#include <QDebug>
#include <QMessageBox>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QString>
#include <QStringList>

#include <functional>
#include <iostream>
#include <iterator>
#include <regex>

using namespace std;

Launcher::Launcher(QObject* parent)
{
    //history 50 | awk '{h[$2]++}END{for(i in h){print h[i],i|"sort -rn|head -20"}}'

    //iwgetid -r; cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address;
}

void Launcher::execTopMemory()
{
    pReadMemory = new QProcess(this);
    QString command = "ps -Ao pid,comm,pmem --sort=-pmem | head -n 11";
    connect(pReadMemory, &QProcess::readyReadStandardOutput, this, &Launcher::returnTopMemory);
    pReadMemory->start("sh", QStringList() << "-c" << command);
}

void Launcher::execTopProcess()
{
    pReadProcess = new QProcess(this);
    QString command = "ps -Ao pid,comm,pcpu --sort=-pcpu | head -n 11";
    connect(pReadProcess, &QProcess::readyReadStandardOutput, this, &Launcher::returnTopProcess);
    pReadProcess->start("sh", QStringList() << "-c" << command);
}

void Launcher::execHardDisk()
{
    pReadHardDisk = new QProcess(this);
    QString command = "df -H";
    connect(pReadHardDisk, &QProcess::readyReadStandardOutput, this, &Launcher::returnHardDisk);
    pReadHardDisk->start("sh", QStringList() << "-c" << command);
}

void Launcher::execActiveServices()
{
    pReadActiveServices = new QProcess(this);
    QString command = "systemctl -t service --state=running | tail -n +2 | head -n -7 | awk -v ORS= '{print $1\"\t\"$2\"\t\"$3\"\t\"$4\"\t\"$5; for(i=6;i<=NF;i++) print (i%1?OFS:\"_\") $i; print (\"\\n\")}' | awk '{ print $1\"\t\"$5}'";

    connect(pReadActiveServices, &QProcess::readyReadStandardOutput,
        this, &Launcher::returnActiveServices);

    connect(pReadActiveServices, &QProcess::readyReadStandardError,
        this, &Launcher::returnStandardError);

    pReadActiveServices->start("sh", QStringList() << "-c" << command);
}

void Launcher::execOpenPorts()
{
    pOpenPorts = new QProcess(this);
    QString command = "sudo netstat -tlnp | awk '{print $7, $4, $1}'";
    connect(pOpenPorts, &QProcess::readyReadStandardOutput, this, &Launcher::returnOpenPorts);
    pOpenPorts->start("sh", QStringList() << "-c" << command);
}

void Launcher::execSystemdAnalyze()
{
    pSystemdAnalyze = new QProcess(this);
    QString command = "systemd-analyze blame | head -10 |  sed -e 's/^[ \t]*//'";
    connect(pSystemdAnalyze, &QProcess::readyReadStandardOutput,
        this, &Launcher::returnSystemdAnalyze);
    pSystemdAnalyze->start("sh", QStringList() << "-c" << command);
}

void Launcher::execTime()
{
    //echo "Date=$(date +"%H:%M%p" )";echo "DateGMT=$(date -u +"%H:%M%p")";echo "DateDesc=$(date +%A,' '%d' '%B,' '%Y)";echo "DatePersian=$(jdate +%G' '%d' '%V','%Y|fribidi --ltr)";

    //date +"%H:%M%p"; date -u +"%H:%M%p"; date +%A,' '%d' '%B,' '%Y; jdate +%G' '%d' '%V','%Y|fribidi --ltr;

    pTime = new QProcess(this);
    QString command = "date +\"%H:%M %p\"; date -u +\"%H:%M %p\"; date +%A,' '%d' '%B,' '%Y; jdate +%G' '%d' '%V' '%Y";
    connect(pTime, &QProcess::readyReadStandardOutput, this, &Launcher::returnTime);
    pTime->start("sh", QStringList() << "-c" << command);
}

void Launcher::execMainInfo()
{
    //uname -o; uname -r; uname -n; uname -m; echo $SHELL; echo $LANG; echo $EDITOR; echo $PAGER; echo $XDG_CURRENT_DESKTOP; echo $QT_QPA_PLATFORMTHEME; echo $DISPLAY;[ -d /sys/firmware/efi ] && echo UEFI || echo BIOS; echo $(lspci | grep VGA | cut -d" " -f5 | sed ':a;N;$!ba;s/\n/+/g'); echo $(xrandr --listproviders | awk '{print $(NF)}' | tail -2 | sed ':a;N;$!ba;s/\n/+/g' | sed -e 's/name://g');systemctl list-units -t service --all | wc -l; systemctl list-units -t service --failed | wc -l;lsmod | wc -l;

    //echo "OS:$(uname -o)"; echo "Kernel:$(uname -r)"; echo "UserName:$(uname -n)"; echo "Arch:$(uname -m)";  echo "Shell:$(echo $SHELL)"; echo "Language:$(echo $LANG)"; echo "Editor:$(echo $EDITOR)"; echo "Pager:$(echo $PAGER)"; echo "DE:$(echo $XDG_CURRENT_DESKTOP)"; echo "Qt.ver:$(echo $QT_QPA_PLATFORMTHEME)"; echo "Display:$(echo $DISPLAY)"; echo "Bios/UEFI:$([ -d /sys/firmware/efi ] && echo UEFI || echo BIOS)"; echo "VGAs:$(echo $(lspci | grep VGA | cut -d" " -f5 | sed ':a;N;$!ba;s/\n/+/g'))"; echo "VGA.Drivers:$(echo $(xrandr --listproviders | awk '{print $(NF)}' | tail -2 | sed ':a;N;$!ba;s/\n/+/g' | sed -e 's/name://g'))"; echo "All Services:$(systemctl list-units -t service --all | wc -l)"; echo "Failed:$(systemctl list-units -t service --failed | wc -l)"; echo "Kernel Modules:$(lsmod | wc -l)";

    //echo \"VGAs:$(echo $(lspci | grep VGA | cut -d" " -f5 | sed ':a;N;$!ba;s/\n/+/g'))\"; echo \"VGA.Drivers:$(echo $(xrandr --listproviders | awk '{print $(NF)}' | tail -2 | sed ':a;N;$!ba;s/\n/+/g' | sed -e 's/name://g'))\";

    pMainInfo = new QProcess(this);
    QString command = "echo \"OS=$(uname -o)\"; echo \"Kernel=$(uname -r)\"; echo \"User=$(uname -n)\"; echo \"Arch=$(uname -m)\";  echo \"Shell=$(echo $SHELL)\"; echo \"Language=$(echo $LANG)\"; echo \"Editor=$(echo $EDITOR)\"; echo \"Pager=$(echo $PAGER)\"; echo \"DE=$(echo $XDG_CURRENT_DESKTOP)\"; echo \"Qt.ver=$(echo $QT_QPA_PLATFORMTHEME)\"; echo \"Display=$(echo $DISPLAY)\"; echo \"Bios/UEFI=$([ -d /sys/firmware/efi ] && echo UEFI || echo BIOS)\"; echo \"All Services=$(systemctl list-units -t service --all | wc -l)\"; echo \"Failed=$(systemctl list-units -t service --failed | wc -l)\"; echo \"Kernel Modules=$(lsmod | wc -l)\";";

    connect(pMainInfo, &QProcess::readyReadStandardOutput, this, &Launcher::returnMainInfo);
    pMainInfo->start("sh", QStringList() << "-c" << command);
}

void Launcher::returnTopMemory()
{
    QString outPut = QString(pReadMemory->readAllStandardOutput());
    QStringList list = beautifyOutput(outPut);
    std::regex word_regex = getPattern();
    QVariantList parent = performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnTopProcess()
{
    QString outPut = QString(pReadProcess->readAllStandardOutput());
    QStringList list = beautifyOutput(outPut);
    std::regex word_regex = getPattern();
    QVariantList parent = performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnHardDisk()
{
    QString outPut = QString(pReadHardDisk->readAllStandardOutput());
    QStringList list = beautifyOutput(outPut);
    std::regex word_regex = getPattern();
    QVariantList parent = performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnActiveServices()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    std::regex word_regex = getSimplePattern();
    QVariantList parent = performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnOpenPorts()
{
    QString outPut = QString(pOpenPorts->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeFirst();
    list.removeFirst();
    list.removeLast();
    std::regex word_regex = getSimplePattern();
    QVariantList parent = performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnSystemdAnalyze()
{
    QString outPut = QString(pSystemdAnalyze->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeLast();
    std::regex word_regex = getSimplePattern();
    QVariantList parent = performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnTime()
{
    QString outPut = QString(pTime->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeLast();
    QVariantList lst;
    foreach (QString item, list) {
        lst.append(item);
    }
    emit modelReady(lst);
}

void Launcher::returnMainInfo()
{
    QString outPut = QString(pMainInfo->readAllStandardOutput());
    QVariantList var = beautifer(outPut);
    emit modelReady(var);
}

void Launcher::returnStandardError()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
    qDebug() << outPut;
}

QStringList Launcher::beautifyOutput(QString outPut)
{
    QStringList list = outPut.split("\n");
    list.removeFirst();
    list.removeLast();
    return list;
}

QVariantList Launcher::beautifer(QString outPut)
{
    QVariantList finalList;
    QStringList list = outPut.split("\n");
    list.removeLast();
    foreach (QString item, list) {
        QStringList splittedList = item.split("=");
        finalList.append(splittedList);
    }
    return finalList;
}

regex Launcher::getPattern()
{
    // ((\d)+\.?([\dkmgKGM%])*)|(\/([\w\d\-\/])*)|([a-zA-z]+ [a-zA-Z]+)|((\w+-)+\w+)|(\w+)
    // link: https://regex101.com/r/VKsGMs/1
    std::string blendedNumbers = "((\\d)+\.?([\\dkmgKGM%])*)";
    std::string dashSlashWord = "(\/([\\w\\d\-\/])*)";
    std::string distinctWord = "([a-zA-z]+ [a-zA-Z]+)";
    std::string dashWord = "((\\w+-)+\\w+)";
    std::string singleWord = "(\\w+)";
    std::string spacer = "|";

    std::regex word_regex(blendedNumbers + spacer
            + dashSlashWord + spacer
            + distinctWord + spacer
            + dashWord + spacer
            + singleWord,
        std::regex_constants::ECMAScript);

    return word_regex;
}

regex Launcher::getSimplePattern()
{
    // select until new line: (?<=\n\n)(.*)(?=\n\n)
    // distint words with only one tab: (\S*?)(\s|$) or .+?(?=\s|$)
    // get all words: (\S*)(\s*)
    std::string distinctWords = "(\\S*)(\\s*)";

    std::regex word_regex(distinctWords, std::regex_constants::ECMAScript);
    return word_regex;
}

QVariantList Launcher::performRegx(std::regex word_regex, QStringList list)
{
    QVariantList parent;
    foreach (QString var, list) {
        QVariantList items;
        std::string mVar = var.toUtf8().constData();

        auto words_begin = std::sregex_iterator(mVar.begin(), mVar.end(), word_regex);
        auto words_end = std::sregex_iterator();

        for (std::sregex_iterator i = words_begin; i != words_end; ++i) {
            std::smatch match = *i;
            std::string match_str = match.str();

            items << QString::fromStdString(match_str);
        }
        parent.insert(parent.size(), items);
    }
    return parent;
}
