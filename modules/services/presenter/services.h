#ifndef SERVICES_H
#define SERVICES_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

class Services : public QObject {
    Q_OBJECT

public:
    explicit Services(QObject* parent = nullptr);

    QProcess* pReadActiveServices;

    Q_INVOKABLE void execActiveServices();

    void returnActiveServices();
    void returnStandardError();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};

#endif // SERVICES_H
