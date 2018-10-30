#include "modules/systemdAnalyze/presenter/systemdAnalyze.h"
#include "modules/systemdAnalyze/presenter/systemdAnalyzeMacro.h"
#include "modules/utils/utils.h"

#include <QString>

using namespace std;

SystemdAnalyze::SystemdAnalyze(QObject* parent)
{
}

void SystemdAnalyze::execSystemdAnalyze()
{
    pSystemdAnalyze = new QProcess(this);
    connect(pSystemdAnalyze, &QProcess::readyReadStandardOutput,
        this, &SystemdAnalyze::returnSystemdAnalyze);
    pSystemdAnalyze->start("sh", QStringList() << "-c" << SYSTEMD_ANALYZE);
}

void SystemdAnalyze::returnSystemdAnalyze()
{
    QString outPut = QString(pSystemdAnalyze->readAllStandardOutput());
    QStringList list = outPut.split("\n");
    list.removeLast();
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}
