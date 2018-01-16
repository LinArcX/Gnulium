#include "modules/pacman/presenter/pacman.h"
#include "modules/dispatcher/dispatcher.h"
#include "modules/pacman/presenter/macros/pacmanMacro.h"
#include "modules/utils/utils.h"
#include <QDebug>
#include <QFile>
#include <QProcess>
#include <QProcessEnvironment>
#include <QString>
#include <QTextStream>
#include <QVariantList>

#include <cstdlib>
#include <iterator>
#include <regex>

using namespace std;

Pacman::Pacman(QObject* parent)
{
}

std::vector<QString> Pacman::readConfigFile()
{
    QFile mFile(PACMAN_CONF_DIR);
    if (!mFile.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "could not open the file!";
        return {};
    }
    QTextStream in(&mFile);
    std::vector<QString> vFile;

    while (!in.atEnd()) {
        QString mLine = in.readLine();
        if (mLine.startsWith("[") && mLine != ("[options]")) {
            mLine.remove(0, 1);
            mLine.remove(mLine.length() - 1, 1);
            vFile.push_back(mLine);
        }
    }

    mFile.close();
    return vFile;
}

void Pacman::execPackages()
{
    pRepos = new QProcess(this);
    QString allPackages = "";
    std::vector<QString> repos = readConfigFile();
    for (auto i = repos.begin(); i != repos.end(); i++) {
        allPackages.append("echo \""
            + *i
            + "=$(paclist "
            + *i
            + " | wc -l;)\"; ");
    }
    connect(pRepos, &QProcess::readyReadStandardOutput, this, &Pacman::returnPackages);
    pRepos->start("sh", QStringList() << "-c" << allPackages);
}

void Pacman::execNextUpdateList()
{
    pNextUpdateList = new QProcess(this);
    connect(pNextUpdateList, &QProcess::readyReadStandardOutput, this, &Pacman::returnNextUpdateList);
    pNextUpdateList->start("sh", QStringList() << "-c" << NEXT_UPDATE_LIST);
}

void Pacman::execRepoSummary()
{
    pRepoSummary = new QProcess(this);
    connect(pRepoSummary, &QProcess::readyReadStandardOutput, this, &Pacman::returnRepoSummary);
    pRepoSummary->start("sh", QStringList() << "-c" << REPO_SUMMARY);
}

void Pacman::execNextUpdateSize()
{
    pNextUpdateSize = new QProcess(this);
    connect(pNextUpdateSize, &QProcess::readyReadStandardOutput, this, &Pacman::returnNextUpdateSize);
    pNextUpdateSize->start("sh", QStringList() << "-c" << NEXT_UPDATE_SIZE);
}

void Pacman::execLastUpgradeTime()
{
    pLastUpgradeTime = new QProcess(this);
    connect(pLastUpgradeTime, &QProcess::readyReadStandardOutput, this, &Pacman::returnLastUpgradeTime);
    pLastUpgradeTime->start("sh", QStringList() << "-c" << LAST_UPGRADE_TIME);
}

void Pacman::execMyAurHelper()
{
    pMyAurHelper = new QProcess(this);
    connect(pMyAurHelper, &QProcess::readyReadStandardOutput, this, &Pacman::returnMyAurHelper);
    pMyAurHelper->start("sh", QStringList() << "-c" << MY_AUR_HELPER);
}

void Pacman::execQueryFileDB(QString file)
{
    QString cmd = QString("pacman -Fs ") + file + "| grep '^\\S' | sed '\/erro\r/,+1 d' | tr \/ \" \"";
    pQueryFileDB = new QProcess(this);
    connect(pQueryFileDB, &QProcess::readyReadStandardOutput, this, &Pacman::returnQueryFileDB);
    pQueryFileDB->start("sh", QStringList() << "-c" << cmd);
}

void Pacman::returnPackages()
{
    QString outPut = QString(pRepos->readAllStandardOutput());
    QVariantList parent = Utils::beautifer(outPut);
    emit modelReady(parent);
}

void Pacman::returnNextUpdateList()
{
    QString outPut = QString(pNextUpdateList->readAllStandardOutput());
    QStringList strList = Utils::beautifyLast(outPut);

    QVariantList parent;
    foreach (QString s, strList) {
        parent << s;
    }
    emit modelReady(parent);
}

void Pacman::returnRepoSummary()
{
    QString outPut = QString(pRepoSummary->readAllStandardOutput());
    QVariantList parent = Utils::beautifer(outPut);
    emit modelReady(parent);
}

void Pacman::returnNextUpdateSize()
{
    QString outPut = QString(pNextUpdateSize->readAllStandardOutput());
    QVariant parent;
    parent = outPut.split("\n").first();
    emit singleModelReady(parent);
}

void Pacman::returnLastUpgradeTime()
{
    QString outPut = QString(pLastUpgradeTime->readAllStandardOutput());
    QVariant parent;
    parent = outPut.split("\n").first();
    emit singleModelReady(parent);
}

void Pacman::returnMyAurHelper()
{
    QString outPut = QString(pMyAurHelper->readAllStandardOutput());
    QVariant parent;
    parent = outPut.split("\n").first();
    emit singleModelReady(parent);
}

void Pacman::returnQueryFileDB()
{
    QString outPut = QString(pQueryFileDB->readAllStandardOutput());
    QStringList list = Utils::beautifyLast(outPut);
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}
