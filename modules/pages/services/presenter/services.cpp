#include <QString>

#include "modules/pages/services/presenter/services.h"
#include "modules/pages/services/presenter/servicesMacro.h"
#include "util/cpp/utils.h"

using namespace std;

Services::Services(QObject* parent)
{
}

void Services::execActiveServices()
{
    pReadActiveServices = new QProcess(this);

    connect(pReadActiveServices, &QProcess::readyReadStandardOutput,
        this, &Services::returnActiveServices);

    connect(pReadActiveServices, &QProcess::readyReadStandardError,
        this, &Services::returnStandardError);

    pReadActiveServices->start("sh", QStringList() << "-c" << ACTIVE_SERVICES);
}

void Services::returnActiveServices()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}

void Services::returnStandardError()
{
    QString outPut = QString(pReadActiveServices->readAllStandardOutput());
}
