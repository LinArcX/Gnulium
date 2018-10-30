#ifndef PORTS_H
#define PORTS_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

class Ports : public QObject {
    Q_OBJECT

public:
    explicit Ports(QObject* parent = nullptr);

    QProcess* pOpenPorts;

    Q_INVOKABLE void execOpenPorts();

    void returnOpenPorts();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};

#endif // PORTS_H
