#include <QString>

#include "modules/pages/ports/presenter/ports.h"
#include "modules/pages/ports/presenter/portsMacro.h"
#include "util/cpp/utils.h"

using namespace std;

Ports::Ports(QObject* parent)
{
}

void Ports::execOpenPorts()
{
    pOpenPorts = new QProcess(this);
    connect(pOpenPorts, &QProcess::readyReadStandardOutput, this, &Ports::returnOpenPorts);
    pOpenPorts->start("sh", QStringList() << "-c" << OPEN_PORTS);
}

void Ports::returnOpenPorts()
{
    QString outPut = QString(pOpenPorts->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeFirst();
    list.removeFirst();
    list.removeLast();
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}
