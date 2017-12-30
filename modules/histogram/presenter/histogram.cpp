#include "modules/histogram/presenter/histogram.h"
#include "modules/dispatcher/dispatcher.h"
#include "modules/utils/utils.h"
#include <QDebug>
#include <QProcess>
#include <QProcessEnvironment>
#include <QString>
#include <cstdlib>

using namespace std;
//using namespace Utils;

Histogram::Histogram(QObject* parent)
{
    //iwgetid -r; cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address;
}

void Histogram::execHistogram()
{

    // varName=someValue; if [[ $SHELL == *'zsh'* ]] ; then varName=~/'.zhistory'; elif [[ $SHELL == *'bash'* ]]; then varName=~/'.bash_history'; fi; cat $varName | cut -d';' -f2  | awk '{h[$1]++}END{for(i in h){print h[i],i|"sort -rn|head -20"}}'

    pHistogram = new QProcess(this);

    QString command = "varName=someValue; if [[ $SHELL == *'zsh'* ]] ; then varName=~/'.zhistory'; elif [[ $SHELL == *'bash'* ]]; then varName=~/'.bash_history'; fi; cat $varName | cut -d';' -f2  | awk '{h[$1]++}END{for(i in h){print h[i],i|\"sort -rn|head -10\"}}' | tac";

    connect(pHistogram, &QProcess::readyReadStandardOutput, this, &Histogram::returnHistogram);
    connect(pHistogram, &QProcess::readyReadStandardError, this, &Histogram::returnStandardError);

    pHistogram->start("sh", QStringList() << "-c" << command);
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
