#ifndef DASHBOARD_H
#define DASHBOARD_H

#include "modules/core/Info/info_manager.h"
#include "util/cpp/PropertyHelper.h"

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

    QProcess* pKernelTime;
    QProcess* pUserSpaceTime;
    QProcess* pTotalTime;

    QProcess* pCurrentTime;
    QProcess* pGregorianDate;
    QProcess* pPersianDate;

    QProcess* pArchAge;
    QProcess* pUpTime;
    QProcess* pVGA;
    QProcess* pTorStatus;

    Q_INVOKABLE void getKernelTime();
    Q_INVOKABLE void getUserSpaceTime();
    Q_INVOKABLE void getTotlaTime();

    Q_INVOKABLE void getCurrentTime();
    Q_INVOKABLE void getGregorianDate();
    Q_INVOKABLE void getPersianDate();

    Q_INVOKABLE void getDownloadPercent();
    Q_INVOKABLE void getUploadPercent();

    Q_INVOKABLE void getArchAge();
    Q_INVOKABLE void getUpTime();
    Q_INVOKABLE void getVGA();
    Q_INVOKABLE void getTorStatus();

    void kernelTime();
    void userSpaceTime();
    void totlaTime();

    void currentTime();
    void gregorianDate();
    void persianDate();

    void archAge();
    void upTime();
    void vga();
    void torStatus();

    ////////////////////////////

    QProcess* pMainInfo;
    QProcess* pReadMemory;
    QProcess* pReadProcess;
    QProcess* pReadHardDisk;
    QProcess* pOpenPorts;
    QProcess* pSystemdAnalyze;
    QProcess* pBootTime;

    Q_INVOKABLE void execTopProcess();
    Q_INVOKABLE void execTimePersian();

    void returnTopMemory();
    void returnTopProcess();
    void returnTimePersian();

    std::regex getPattern();
    std::regex getHugePattern();
    std::regex getSimplePattern();
    QStringList beautifyOutput(QString outPut);
    QVariantList beautifer(QString outPut);
    QVariantList performRegx(std::regex word_regex, QStringList list);

public slots:

signals:
    void kernelTimeReady(QVariant kernelTime);
    void userSpaceTimeReady(QVariant userSpaceTime);
    void totalTimeReady(QVariant totalTime);

    void currentTimeReady(QVariant currentTime);
    void gregorianDateReady(QVariant gregorianDate);
    void persianDateReady(QVariant persianDate);

    void downloadInfoReady(QVariantList downloadInfo);
    void uploadInfoReady(QVariant uploadInfo);

    void archAgeReady(QVariant archAge);
    void upTimeReady(QVariant upTime);
    void vgasReady(QVariant vgas);
    void torStatusReady(QVariant torStatus);

    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);
    void valueChanged();

private:
    int mCounter;
    QTimer* mTimer;
    InfoManager* im;
};

#endif // DASHBOARD_H
