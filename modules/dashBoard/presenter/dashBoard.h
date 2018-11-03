#ifndef DASHBOARD_H
#define DASHBOARD_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QTimer>
#include <QVariant>
#include <regex>

class DashBoard : public QObject {
    Q_OBJECT

public:
    explicit DashBoard(QObject* parent = nullptr);

    QProcess* pGregorianDate;
    QProcess* pCurrentTime;

    QProcess* pMainInfo;
    QProcess* pReadMemory;
    QProcess* pReadProcess;
    QProcess* pReadHardDisk;
    QProcess* pOpenPorts;
    QProcess* pSystemdAnalyze;
    QProcess* pBootTime;
    QProcess* pArchAge;
    QProcess* pUpTime;
    QProcess* pTorStatus;
    QProcess* pVGA;

    Q_INVOKABLE void getGregorianDate();
    Q_INVOKABLE void getCurrentTime();

    Q_INVOKABLE void updateNetworkBar();
    Q_INVOKABLE void execTopProcess();
    Q_INVOKABLE void execTimePersian();
    Q_INVOKABLE void execBootTime();
    Q_INVOKABLE void execArchAge();
    Q_INVOKABLE void execUpTime();
    Q_INVOKABLE void execTorStatus();
    Q_INVOKABLE void execVGA();

    void returnTopMemory();
    void returnTopProcess();
    void gregorianDate();
    void currentTime();
    void returnTimePersian();
    void returnBootTime();
    void returnArchAge();
    void returnUpTime();
    void returnTorStatus();
    void returnVGA();

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
    void gregorianDateReady(QVariant gregorianDate);
    void currentTimeReady(QVariant currentTime);
    void valueChanged();

private:
    int mCounter;
    QTimer* mTimer;
    InfoManager* im;
};

#endif // DASHBOARD_H
