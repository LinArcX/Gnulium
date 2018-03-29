#include "modules/home/presenter/home.h"
#include "modules/home/presenter/macros/homeMacro.h"
#include "modules/utils/utils.h"
#include <QProcess>
#include <QString>
#include <QStringList>

using namespace std;

Home::Home(QObject* parent)
{
}

void Home::execTopMemory()
{
    pReadMemory = new QProcess(this);
    connect(pReadMemory, &QProcess::readyReadStandardOutput, this, &Home::returnTopMemory);
    pReadMemory->start("sh", QStringList() << "-c" << TOP_MEMORY);
}

void Home::execTopProcess()
{
    pReadProcess = new QProcess(this);
    connect(pReadProcess, &QProcess::readyReadStandardOutput, this, &Home::returnTopProcess);
    pReadProcess->start("sh", QStringList() << "-c" << TOP_CPU);
}

void Home::execHardDisk()
{
    pReadHardDisk = new QProcess(this);
    connect(pReadHardDisk, &QProcess::readyReadStandardOutput, this, &Home::returnHardDisk);
    pReadHardDisk->start("sh", QStringList() << "-c" << HARD_DISK);
}

void Home::execActiveServices()
{
    pReadActiveServices = new QProcess(this);

    connect(pReadActiveServices, &QProcess::readyReadStandardOutput,
        this, &Home::returnActiveServices);

    connect(pReadActiveServices, &QProcess::readyReadStandardError,
        this, &Home::returnStandardError);

    pReadActiveServices->start("sh", QStringList() << "-c" << ACTIVE_SERVICES);
}

void Home::execOpenPorts()
{
    pOpenPorts = new QProcess(this);
    connect(pOpenPorts, &QProcess::readyReadStandardOutput, this, &Home::returnOpenPorts);
    pOpenPorts->start("sh", QStringList() << "-c" << OPEN_PORTS);
}

void Home::execSystemdAnalyze()
{
    pSystemdAnalyze = new QProcess(this);
    connect(pSystemdAnalyze, &QProcess::readyReadStandardOutput,
        this, &Home::returnSystemdAnalyze);
    pSystemdAnalyze->start("sh", QStringList() << "-c" << SYSTEMD_ANALYZE);
}

void Home::execTime()
{
    pTime = new QProcess(this);
    connect(pTime, &QProcess::readyReadStandardOutput, this, &Home::returnTime);
    pTime->start("sh", QStringList() << "-c" << TIME);
}

void Home::execBootTime()
{
    pBootTime = new QProcess(this);
    connect(pBootTime, &QProcess::readyReadStandardOutput, this, &Home::returnBootTime);
    pBootTime->start("sh", QStringList() << "-c" << BOOT_TIME);
}

void Home::execArchAge()
{
    pArchAge = new QProcess(this);
    connect(pArchAge, &QProcess::readyReadStandardOutput, this, &Home::returnArchAge);
    pArchAge->start("sh", QStringList() << "-c" << ARCH_AGE);
}

void Home::execUpTime()
{
    pUpTime = new QProcess(this);
    connect(pUpTime, &QProcess::readyReadStandardOutput, this, &Home::returnUpTime);
    pUpTime->start("sh", QStringList() << "-c" << UP_TIME);
}

void Home::execMainInfo()
{
    pMainInfo = new QProcess(this);
    connect(pMainInfo, &QProcess::readyReadStandardOutput, this, &Home::returnMainInfo);
    pMainInfo->start("sh", QStringList() << "-c" << MAIN_INFO);
}

void Home::execTorStatus()
{
    pTorStatus = new QProcess(this);
    connect(pTorStatus, &QProcess::readyReadStandardOutput, this, &Home::returnTorStatus);
    pTorStatus->start(TOR_STATUS);
}

void Home::execVGA()
{
    pVGA = new QProcess(this);
    connect(pVGA, &QProcess::readyReadStandardOutput, this, &Home::returnVGA);
    pVGA->start("sh", QStringList() << "-c" << VGA);
}

void Home::returnTopMemory()
{
    QString outPut = QString(pReadMemory->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getHugePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Home::returnTopProcess()
{
    QString outPut = QString(pReadProcess->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getHugePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Home::returnHardDisk()
{
    QString outPut = QString(pReadHardDisk->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getPattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Home::returnActiveServices()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Home::returnOpenPorts()
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

void Home::returnSystemdAnalyze()
{
    QString outPut = QString(pSystemdAnalyze->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeLast();
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Home::returnTime()
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

void Home::returnBootTime()
{
    QString outPut = QString(pBootTime->readAllStandardOutput());
    QVariantList lst = Utils::beautifer(outPut);
    emit modelReady(lst);
}

void Home::returnArchAge()
{
    QString outPut = QString(pArchAge->readAllStandardOutput());
    QVariant qv(outPut);
    emit singleModelReady(qv);
}

void Home::returnUpTime()
{
    QString outPut = QString(pUpTime->readAllStandardOutput());
    QVariant qv(outPut);
    emit singleModelReady(qv);
}

void Home::returnTorStatus()
{
    QString outPut = QString(pTorStatus->readAllStandardOutput());
    if (outPut.contains("Bootstrapped")) {
        QString status = outPut.split("Bootstrapped").last();
        QString percent = status.split(":").first();
        QVariant qv(percent);
        emit singleModelReady(qv);
    } else {
        QString percent = "0%";
        QVariant qv(percent);
        emit singleModelReady(qv);
    }
}

void Home::returnVGA()
{
    QStringList outPut = QString(pVGA->readAllStandardOutput()).split("\n");
    outPut.removeLast();

    QString vgas;
    for (int i = 0; i < outPut.size(); ++i) {
        if (i == outPut.size() - 1) {
            vgas.append(outPut.at(i));
        } else {
            vgas.append(outPut.at(i) + "+");
        }
    }
    QVariant qv(vgas);
    emit singleModelReady(qv);
}

void Home::returnMainInfo()
{
    QString outPut = QString(pMainInfo->readAllStandardOutput());
    QVariantList var = Utils::beautifer(outPut);
    emit modelReady(var);
}

void Home::returnStandardError()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
}
