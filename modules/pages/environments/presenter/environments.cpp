#include "modules/pages/environments/presenter/environments.h"
#include "modules/pages/environments/presenter/environmentsMacro.h"
#include "util/cpp/utils.h"

#include <QString>

using namespace std;

Environments::Environments(QObject* parent)
{
}

void Environments::execMainInfo()
{
    pMainInfo = new QProcess(this);
    connect(pMainInfo, &QProcess::readyReadStandardOutput, this, &Environments::returnMainInfo);
    pMainInfo->start("sh", QStringList() << "-c" << MAIN_INFO);
}

void Environments::returnMainInfo()
{
    QString outPut = QString(pMainInfo->readAllStandardOutput());
    QVariantList var = Utils::beautifer(outPut);
    emit modelReady(var);
}
