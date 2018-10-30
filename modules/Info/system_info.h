#ifndef SYSTEMINFO_H
#define SYSTEMINFO_H

#include "modules/Info/cpu_info.h"
#include "modules/utils/command_util.h"
#include "modules/utils/file_util.h"
#include "modules/utils/format_util.h"

#define PROC_CPUINFO "/proc/cpuinfo"

#include "modules/utils/stacer-core_global.h"

class STACERCORESHARED_EXPORT SystemInfo {
public:
    SystemInfo();

    QString getHostname() const;
    QString getPlatform() const;
    QString getDistribution() const;
    QString getKernel() const;
    QString getCpuModel() const;
    QString getCpuSpeed() const;
    QString getCpuCore() const;
    QString getUsername() const;

    QFileInfoList getCrashReports() const;
    QFileInfoList getAppLogs() const;
    QFileInfoList getAppCaches() const;

private:
    QString cpuCore;
    QString cpuModel;
    QString cpuSpeed;
    QString username;
};

#endif // SYSTEMINFO_H
