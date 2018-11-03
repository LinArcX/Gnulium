#include <QProcess>
#include <QString>
#include <QStringList>

#include "modules/Info/process.h"
#include "modules/dashBoard/presenter/dashBoard.h"
#include "modules/dashBoard/presenter/dashBoardMacro.h"
#include "modules/dispatcher/dispatcher.h"
#include "modules/utils/utils.h"

using namespace std;

DashBoard::DashBoard(QObject* parent)
    : mTimer(new QTimer(this))
    , im(InfoManager::ins())
{
}

void DashBoard::getGregorianDate()
{
    pGregorianDate = new QProcess(this);
    connect(pGregorianDate, &QProcess::readyReadStandardOutput, this, &DashBoard::gregorianDate);
    pGregorianDate->start("sh", QStringList() << "-c" << DATE_JEORGIAN);
}

void DashBoard::getCurrentTime()
{
    pCurrentTime = new QProcess(this);
    connect(pCurrentTime, &QProcess::readyReadStandardOutput, this, &DashBoard::currentTime);
    pCurrentTime->start("sh", QStringList() << "-c" << CURRENT_TIME);
}

void DashBoard::gregorianDate()
{
    QString outPut = QString(pGregorianDate->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    emit gregorianDateReady(list.first());
}

void DashBoard::currentTime()
{
    QString outPut = QString(pCurrentTime->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    emit currentTimeReady(list.first());
}

void DashBoard::updateNetworkBar()
{
    static quint64 l_RXbytes = im->getRXbytes();
    static quint64 l_TXbytes = im->getTXbytes();
    static quint64 max_RXbytes = 1L << 20; // 1 MEBI
    static quint64 max_TXbytes = 1L << 20; // 1 MEBI

    quint64 RXbytes = im->getRXbytes();
    quint64 TXbytes = im->getTXbytes();

    quint64 d_RXbytes = (RXbytes - l_RXbytes);
    quint64 d_TXbytes = (TXbytes - l_TXbytes);

    QString downText = FormatUtil::formatBytes(d_RXbytes);
    QString upText = FormatUtil::formatBytes(d_TXbytes);

    int downPercent = ((double)d_RXbytes / (double)max_RXbytes) * 100.0;
    int upPercent = ((double)d_TXbytes / (double)max_TXbytes) * 100.0;

    //    mDownloadBar->setValue(downPercent,
    //        QString("%1/s").arg(downText),
    //        tr("Total: %1").arg(FormatUtil::formatBytes(RXbytes)));

    //    mUploadBar->setValue(upPercent,
    //        QString("%1/s").arg(upText),
    //        tr("Total: %1").arg(FormatUtil::formatBytes(TXbytes)));

    max_RXbytes = qMax(max_RXbytes, d_RXbytes);
    max_TXbytes = qMax(max_TXbytes, d_TXbytes);

    l_RXbytes = RXbytes;
    l_TXbytes = TXbytes;
}

void DashBoard::execTopProcess()
{
    pReadProcess = new QProcess(this);
    connect(pReadProcess, &QProcess::readyReadStandardOutput, this, &DashBoard::returnTopProcess);
    pReadProcess->start("sh", QStringList() << "-c" << TOP_CPU);
}

void DashBoard::returnTopProcess()
{
    QString outPut = QString(pReadProcess->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getHugePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void DashBoard::returnTopMemory()
{
    QString outPut = QString(pReadMemory->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getHugePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void DashBoard::execTimePersian()
{
    //    pTime = new QProcess(this);
    //    connect(pTime, &QProcess::readyReadStandardOutput, this, &DashBoard::returnTimePersian);
    //    pTime->start("sh", QStringList() << "-c" << TIME);
}

void DashBoard::execBootTime()
{
    pBootTime = new QProcess(this);
    connect(pBootTime, &QProcess::readyReadStandardOutput, this, &DashBoard::returnBootTime);
    pBootTime->start("sh", QStringList() << "-c" << BOOT_TIME);
}

void DashBoard::execArchAge()
{
    pArchAge = new QProcess(this);
    connect(pArchAge, &QProcess::readyReadStandardOutput, this, &DashBoard::returnArchAge);
    pArchAge->start("sh", QStringList() << "-c" << ARCH_AGE);
}

void DashBoard::execUpTime()
{
    pUpTime = new QProcess(this);
    connect(pUpTime, &QProcess::readyReadStandardOutput, this, &DashBoard::returnUpTime);
    pUpTime->start("sh", QStringList() << "-c" << UP_TIME);
}

void DashBoard::execTorStatus()
{
    pTorStatus = new QProcess(this);
    connect(pTorStatus, &QProcess::readyReadStandardOutput, this, &DashBoard::returnTorStatus);
    pTorStatus->start(TOR_STATUS);
}

void DashBoard::execVGA()
{
    pVGA = new QProcess(this);
    connect(pVGA, &QProcess::readyReadStandardOutput, this, &DashBoard::returnVGA);
    pVGA->start("sh", QStringList() << "-c" << VGA);
}

void DashBoard::returnTimePersian()
{
    //    QString outPut = QString(pTime->readAllStandardOutput());
    //    QStringList list = outPut.split("\n");
    //    list.removeLast();
    //    QVariantList lst;
    //    foreach (QString item, list) {
    //        lst.append(item);
    //    }
    //    emit modelReady(lst);
}

void DashBoard::returnBootTime()
{
    QString outPut = QString(pBootTime->readAllStandardOutput());
    QVariantList lst = Utils::beautifer(outPut);
    emit modelReady(lst);
}

void DashBoard::returnArchAge()
{
    QString outPut = QString(pArchAge->readAllStandardOutput());
    QVariant qv(outPut);
    emit singleModelReady(qv);
}

void DashBoard::returnUpTime()
{
    QString outPut = QString(pUpTime->readAllStandardOutput());
    QVariant qv(outPut);
    emit singleModelReady(qv);
}

void DashBoard::returnTorStatus()
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

void DashBoard::returnVGA()
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
