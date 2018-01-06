#include "modules/histogram/presenter/histogram.h"
#include "modules/dispatcher/dispatcher.h"
#include "modules/histogram/presenter/macros/histogramMacro.h"
#include "modules/utils/utils.h"
#include <QDebug>
#include <QProcess>
#include <QProcessEnvironment>
#include <QString>
#include <cstdlib>

using namespace std;

Histogram::Histogram(QObject* parent)
{
}

void Histogram::execHistogram()
{
    pHistogram = new QProcess(this);
    connect(pHistogram, &QProcess::readyReadStandardOutput, this, &Histogram::returnHistogram);
    connect(pHistogram, &QProcess::readyReadStandardError, this, &Histogram::returnStandardError);

    pHistogram->start("sh", QStringList() << "-c" << HISTOGRAM);
}

void Histogram::returnStandardError()
{
    QString outPut = QString(pHistogram->readAllStandardError());
    qDebug() << outPut;
}

void Histogram::returnHistogram()
{
    QString outPut = QString(pHistogram->readAllStandardOutput());
    QStringList list = Utils::beautifyLast(outPut);
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}
