#include <QString>

#include "modules/pages/systemdAnalyze/presenter/systemdAnalyze.h"
#include "modules/pages/systemdAnalyze/presenter/systemdAnalyzeMacro.h"
#include "util/cpp/utils.h"

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
