#include "modules/launcher/presenter/launcher.h"
#include "modules/launcher/presenter/macros/launcherMacro.h"
#include "modules/utils/utils.h"
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
}

void Launcher::execTopMemory()
{
    pReadMemory = new QProcess(this);
    connect(pReadMemory, &QProcess::readyReadStandardOutput, this, &Launcher::returnTopMemory);
    pReadMemory->start("sh", QStringList() << "-c" << TOP_MEMORY);
}

void Launcher::execTopProcess()
{
    pReadProcess = new QProcess(this);
    connect(pReadProcess, &QProcess::readyReadStandardOutput, this, &Launcher::returnTopProcess);
    pReadProcess->start("sh", QStringList() << "-c" << TOP_CPU);
}

void Launcher::execHardDisk()
{
    pReadHardDisk = new QProcess(this);
    connect(pReadHardDisk, &QProcess::readyReadStandardOutput, this, &Launcher::returnHardDisk);
    pReadHardDisk->start("sh", QStringList() << "-c" << HARD_DISK);
}

void Launcher::execActiveServices()
{
    pReadActiveServices = new QProcess(this);

    connect(pReadActiveServices, &QProcess::readyReadStandardOutput,
        this, &Launcher::returnActiveServices);

    connect(pReadActiveServices, &QProcess::readyReadStandardError,
        this, &Launcher::returnStandardError);

    pReadActiveServices->start("sh", QStringList() << "-c" << ACTIVE_SERVICES);
}

void Launcher::execOpenPorts()
{
    pOpenPorts = new QProcess(this);
    connect(pOpenPorts, &QProcess::readyReadStandardOutput, this, &Launcher::returnOpenPorts);
    pOpenPorts->start("sh", QStringList() << "-c" << OPEN_PORTS);
}

void Launcher::execSystemdAnalyze()
{
    pSystemdAnalyze = new QProcess(this);
    connect(pSystemdAnalyze, &QProcess::readyReadStandardOutput,
        this, &Launcher::returnSystemdAnalyze);
    pSystemdAnalyze->start("sh", QStringList() << "-c" << SYSTEMD_ANALYZE);
}

void Launcher::execTime()
{
    pTime = new QProcess(this);
    connect(pTime, &QProcess::readyReadStandardOutput, this, &Launcher::returnTime);
    pTime->start("sh", QStringList() << "-c" << TIME);
}

void Launcher::execBootTime()
{
    pBootTime = new QProcess(this);
    connect(pBootTime, &QProcess::readyReadStandardOutput, this, &Launcher::returnBootTime);
    pBootTime->start("sh", QStringList() << "-c" << BOOT_TIME);
}

void Launcher::execArchAge()
{
    pArchAge = new QProcess(this);
    connect(pArchAge, &QProcess::readyReadStandardOutput, this, &Launcher::returnArchAge);
    pArchAge->start("sh", QStringList() << "-c" << ARCH_AGE);
}

void Launcher::execUpTime()
{
    pUpTime = new QProcess(this);
    connect(pUpTime, &QProcess::readyReadStandardOutput, this, &Launcher::returnUpTime);
    pUpTime->start("sh", QStringList() << "-c" << UP_TIME);
}

void Launcher::execMainInfo()
{
    pMainInfo = new QProcess(this);
    connect(pMainInfo, &QProcess::readyReadStandardOutput, this, &Launcher::returnMainInfo);
    pMainInfo->start("sh", QStringList() << "-c" << MAIN_INFO);
}

void Launcher::returnTopMemory()
{
    QString outPut = QString(pReadMemory->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getHugePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnTopProcess()
{
    QString outPut = QString(pReadProcess->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getHugePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnHardDisk()
{
    QString outPut = QString(pReadHardDisk->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getPattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnActiveServices()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnOpenPorts()
{
    QString outPut = QString(pOpenPorts->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeFirst();
    list.removeFirst();
    list.removeLast();
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Launcher::returnSystemdAnalyze()
{
    QString outPut = QString(pSystemdAnalyze->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeLast();
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
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

void Launcher::returnBootTime()
{
    QString outPut = QString(pBootTime->readAllStandardOutput());
    QVariantList lst = Utils::beautifer(outPut);
    emit modelReady(lst);
}

void Launcher::returnArchAge()
{
    QString outPut = QString(pArchAge->readAllStandardOutput());
    QVariant qv(outPut);
    emit singleModelReady(qv);
}

void Launcher::returnUpTime()
{
    QString outPut = QString(pUpTime->readAllStandardOutput());
    QVariant qv(outPut);
    emit singleModelReady(qv);
}

void Launcher::returnMainInfo()
{
    QString outPut = QString(pMainInfo->readAllStandardOutput());
    QVariantList var = Utils::beautifer(outPut);
    emit modelReady(var);
}

void Launcher::returnStandardError()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
    qDebug() << outPut;
}
