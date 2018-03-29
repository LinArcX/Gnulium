#pragma once

#include "modules/utils/macros/PropertyHelper.h"
#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariant>
#include <QVariantList>

class SubFixer : public QObject {
    Q_OBJECT

public:
    explicit SubFixer(QObject* parent = nullptr);

    std::vector<QString> readConfigFile();

    QProcess* pRepos;
    QProcess* pNextUpdateList;
    QProcess* pRepoSummary;
    QProcess* pNextUpdateSize;
    QProcess* pLastUpgradeTime;
    QProcess* pMyAurHelper;
    QProcess* pQueryFileDB;

    Q_INVOKABLE void convertEncoding(QString file);
    Q_INVOKABLE void execNextUpdateList();
    Q_INVOKABLE void execRepoSummary();
    Q_INVOKABLE void execNextUpdateSize();
    Q_INVOKABLE void execLastUpgradeTime();
    Q_INVOKABLE void execMyAurHelper();
    Q_INVOKABLE void execQueryFileDB(QString file);

    void returnPackages();
    void returnNextUpdateList();
    void returnRepoSummary();
    void returnNextUpdateSize();
    void returnLastUpgradeTime();
    void returnMyAurHelper();
    void returnQueryFileDB();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};
