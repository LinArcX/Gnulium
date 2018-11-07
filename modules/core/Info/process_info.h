#ifndef PROCESS_INFO_H
#define PROCESS_INFO_H

#include <QObject>

#include "process.h"
#include <util/cpp/command_util.h>
#include <util/cpp/file_util.h>

#include "util/cpp/stacer-core_global.h"

class STACERCORESHARED_EXPORT ProcessInfo : public QObject {
    Q_OBJECT

public:
    QList<Process> getProcessList() const;

public slots:
    void updateProcesses();

private:
    QList<Process> processList;
};

#endif // PROCESS_INFO_H
