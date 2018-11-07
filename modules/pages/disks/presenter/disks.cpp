#include "modules/pages/disks/presenter/disks.h"
#include "modules/pages/disks/presenter/disksMacro.h"
#include "util/cpp/utils.h"

#include <QString>

using namespace std;

Disks::Disks(QObject* parent)
{
}

void Disks::execHardDisk()
{
    pReadHardDisk = new QProcess(this);
    connect(pReadHardDisk, &QProcess::readyReadStandardOutput, this, &Disks::returnHardDisk);
    pReadHardDisk->start("sh", QStringList() << "-c" << HARD_DISK);
}

void Disks::returnHardDisk()
{
    QString outPut = QString(pReadHardDisk->readAllStandardOutput());
    QStringList list = Utils::beautifyOutput(outPut);
    std::regex word_regex = Utils::getPattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}
