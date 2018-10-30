#ifndef DISKINFO_H
#define DISKINFO_H

#include "modules/utils/command_util.h"
#include "modules/utils/file_util.h"
#include "modules/utils/stacer-core_global.h"
#include <QStorageInfo>

#define PROC_MOUNTS "/proc/mounts"

class Disk;

class STACERCORESHARED_EXPORT DiskInfo {
public:
    QList<Disk*> getDisks() const;
    void updateDiskInfo();
    QList<quint64> getDiskIO() const;
    QString getDiskName() const;

private:
    QList<Disk*> disks;
};

class Disk {
public:
    QString name;
    QString device;
    quint64 size;
    quint64 free;
    quint64 used;
};

#endif // DISKINFO_H
