#ifndef LAUNCHER_H
#define LAUNCHER_H

#include "modules/utils/macros/PropertyHelper.h"
#include <QObject>
#include <QProcess>
#include <QString>
#include <QTimer>
#include <QVariant>
#include <functional>
#include <iostream>
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


    void returnStandardError();
    std::regex getPattern();
    std::regex getHugePattern();
    std::regex getSimplePattern();
    QStringList beautifyOutput(QString outPut);
    QVariantList beautifer(QString outPut);
    QVariantList performRegx(std::regex word_regex, QStringList list);

public slots:
    void execMainInfo();
    void execTopMemory();
    void execTopProcess();
    void execHardDisk();
    void execActiveServices();
    void execOpenPorts();
    void execSystemdAnalyze();
    void execTime();
    void execBootTime();
    void execArchAge();
    void execUpTime();

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
    int mCounter;
};

#endif // LAUNCHER_H
