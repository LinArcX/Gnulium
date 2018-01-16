#ifndef LAUNCHER_H
#define LAUNCHER_H

#include "modules/utils/macros/PropertyHelper.h"
#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariant>
#include <regex>

class Launcher : public QObject {
    Q_OBJECT

public:
    explicit Launcher(QObject* parent = nullptr);

    QProcess* pMainInfo;
    QProcess* pReadMemory;
    QProcess* pReadProcess;
    QProcess* pReadHardDisk;
    QProcess* pReadActiveServices;
    QProcess* pOpenPorts;
    QProcess* pSystemdAnalyze;
    QProcess* pTime;
    QProcess* pBootTime;
    QProcess* pArchAge;
    QProcess* pUpTime;
    QProcess* pTorStatus;
    QProcess* pVGA;

    Q_INVOKABLE void execMainInfo();
    Q_INVOKABLE void execTopMemory();
    Q_INVOKABLE void execTopProcess();
    Q_INVOKABLE void execHardDisk();
    Q_INVOKABLE void execActiveServices();
    Q_INVOKABLE void execOpenPorts();
    Q_INVOKABLE void execSystemdAnalyze();
    Q_INVOKABLE void execTime();
    Q_INVOKABLE void execBootTime();
    Q_INVOKABLE void execArchAge();
    Q_INVOKABLE void execUpTime();
    Q_INVOKABLE void execTorStatus();
    Q_INVOKABLE void execVGA();

    void returnMainInfo();
    void returnTopMemory();
    void returnTopProcess();
    void returnHardDisk();
    void returnActiveServices();
    void returnOpenPorts();
    void returnSystemdAnalyze();
    void returnTime();
    void returnBootTime();
    void returnArchAge();
    void returnUpTime();
    void returnTorStatus();
    void returnVGA();

    void returnStandardError();
    std::regex getPattern();
    std::regex getHugePattern();
    std::regex getSimplePattern();
    QStringList beautifyOutput(QString outPut);
    QVariantList beautifer(QString outPut);
    QVariantList performRegx(std::regex word_regex, QStringList list);

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
    int mCounter;
};

#endif // LAUNCHER_H
