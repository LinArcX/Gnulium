#ifndef SYSTEMDANALYZE_H
#define SYSTEMDANALYZE_H

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

#include "modules/core/Info/info_manager.h"
#include "util/cpp/PropertyHelper.h"

class SystemdAnalyze : public QObject {
    Q_OBJECT

public:
    explicit SystemdAnalyze(QObject* parent = nullptr);

    QProcess* pSystemdAnalyze;

    Q_INVOKABLE void execSystemdAnalyze();

    void returnSystemdAnalyze();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};

#endif // SYSTEMDANALYZE_H
