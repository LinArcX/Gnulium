#ifndef ENVIRONMENTS_H
#define ENVIRONMENTS_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

class Environments : public QObject {
    Q_OBJECT

public:
    explicit Environments(QObject* parent = nullptr);

    QProcess* pMainInfo;

    Q_INVOKABLE void execMainInfo();

    void returnMainInfo();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};

#endif // ENVIRONMENTS_H
