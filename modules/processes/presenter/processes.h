#ifndef PROCESSES_H
#define PROCESSES_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QString>
#include <QTimer>
#include <QVariantList>

class Processes : public QObject {
    Q_OBJECT

public:
    explicit Processes(QObject* parent = nullptr);
    Q_INVOKABLE void execProc();
    void loadProcesses();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
    InfoManager* im;
    QTimer* mTimer;
};

#endif // PROCESSES_H
