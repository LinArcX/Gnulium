#ifndef SERVICES_H
#define SERVICES_H

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

#include "modules/core/Info/info_manager.h"
#include "util/cpp/PropertyHelper.h"

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
