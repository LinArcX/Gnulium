#ifndef DISKS_H
#define DISKS_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

class Disks : public QObject {
    Q_OBJECT

public:
    explicit Disks(QObject* parent = nullptr);

    QProcess* pReadHardDisk;

    Q_INVOKABLE void execHardDisk();

    void returnHardDisk();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};

#endif // DISKS_H
