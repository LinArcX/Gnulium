#ifndef DASHBOARD_H
#define DASHBOARD_H

#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariant>
#include <regex>

class DashBoard : public QObject {
    Q_OBJECT

public:
    explicit DashBoard(QObject* parent = nullptr);

    QProcess* pMainInfo;
    QProcess* pReadMemory;
    QProcess* pReadProcess;
    QProcess* pReadHardDisk;
    QProcess* pOpenPorts;
    QProcess* pSystemdAnalyze;
    QProcess* pTime;
    QProcess* pBootTime;
    QProcess* pArchAge;
    QProcess* pUpTime;
    QProcess* pTorStatus;
    QProcess* pVGA;

    Q_INVOKABLE void execTopProcess();
    Q_INVOKABLE void execTime();
    Q_INVOKABLE void execBootTime();
    Q_INVOKABLE void execArchAge();
    Q_INVOKABLE void execUpTime();
    Q_INVOKABLE void execTorStatus();
    Q_INVOKABLE void execVGA();

    void returnTopMemory();
    void returnTopProcess();
    void returnTime();
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
    void valueChanged();

private:
    int mCounter;
};

#endif // DASHBOARD_H
