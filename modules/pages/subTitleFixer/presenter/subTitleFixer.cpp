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

#include "modules/core/dispatcher/dispatcher.h"
#include "modules/pages/subTitleFixer/presenter/subFixerMacro.h"
#include "modules/pages/subTitleFixer/presenter/subTitleFixer.h"
#include "util/cpp/utils.h"

using namespace std;

SubFixer::SubFixer(QObject* parent)
{
}

std::vector<QString> SubFixer::readConfigFile()
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

void SubFixer::convertEncoding(QString file)
{
    //qDebug() << file.remove(0, 7).simplified() << endl;
    QFile inFile(file.remove(0, 7).simplified());
    if (!inFile.open(QFile::ReadOnly | QFile::Text)) {
        qDebug() << "could not open the file!";
        return void();
    }

    QFile outFile("foo.srt");
    if (!outFile.open(QFile::WriteOnly))
        return;

    QTextStream in(&inFile);
    QTextStream out(&outFile);
    out.setCodec("UTF-8");

    while (!in.atEnd()) {
        QString line = in.readLine();
        qDebug() << line << endl;
        QString command(line.toUtf8());
        out << command << endl;
    }
    qDebug() << out.string() << endl;

    //    qDebug() << file << endl;
    //    qDebug() << file.simplified() << endl;
    //    QFile mFile("/mnt/D/FilmSerial/Film/Blade.Runner.2049/Blade.Runner.2049.2017.srt");
    //    if (!mFile.open(QFile::ReadOnly | QFile::Text)) {
    //        qDebug() << "could not open the file!";
    //        return void();
    //    }
    //    QTextStream in(&mFile);
    //    //qDebug() << in.setCodec("" << endl;
    //    std::vector<QString> vFile;

    //    while (!in.atEnd()) {
    //        QString mLine = in.readLine();
    //        qDebug() << mLine << endl;
    ////        if (mLine.startsWith("[") && mLine != ("[options]")) {
    ////            mLine.remove(0, 1);
    ////            mLine.remove(mLine.length() - 1, 1);
    ////            vFile.push_back(mLine);
    ////        }
    //    }

    //mFile.close();
    //return vFile;
    //qDebug() << file << endl;
}

//void SubFixer::execPackages()
//{
//    pRepos = new QProcess(this);
//    QString allPackages = "";
//    std::vector<QString> repos = readConfigFile();
//    for (auto i = repos.begin(); i != repos.end(); i++) {
//        allPackages.append("echo \""
//            + *i
//            + "=$(paclist "
//            + *i
//            + " | wc -l;)\"; ");
//    }
//    connect(pRepos, &QProcess::readyReadStandardOutput, this, &SubFixer::returnPackages);
//    pRepos->start("sh", QStringList() << "-c" << allPackages);
//}

void SubFixer::execNextUpdateList()
{
    pNextUpdateList = new QProcess(this);
    connect(pNextUpdateList, &QProcess::readyReadStandardOutput, this, &SubFixer::returnNextUpdateList);
    pNextUpdateList->start("sh", QStringList() << "-c" << NEXT_UPDATE_LIST);
}

void SubFixer::execRepoSummary()
{
    pRepoSummary = new QProcess(this);
    connect(pRepoSummary, &QProcess::readyReadStandardOutput, this, &SubFixer::returnRepoSummary);
    pRepoSummary->start("sh", QStringList() << "-c" << REPO_SUMMARY);
}

void SubFixer::execNextUpdateSize()
{
    pNextUpdateSize = new QProcess(this);
    connect(pNextUpdateSize, &QProcess::readyReadStandardOutput, this, &SubFixer::returnNextUpdateSize);
    pNextUpdateSize->start("sh", QStringList() << "-c" << NEXT_UPDATE_SIZE);
}

void SubFixer::execLastUpgradeTime()
{
    pLastUpgradeTime = new QProcess(this);
    connect(pLastUpgradeTime, &QProcess::readyReadStandardOutput, this, &SubFixer::returnLastUpgradeTime);
    pLastUpgradeTime->start("sh", QStringList() << "-c" << LAST_UPGRADE_TIME);
}

void SubFixer::execMyAurHelper()
{
    pMyAurHelper = new QProcess(this);
    connect(pMyAurHelper, &QProcess::readyReadStandardOutput, this, &SubFixer::returnMyAurHelper);
    pMyAurHelper->start("sh", QStringList() << "-c" << MY_AUR_HELPER);
}

void SubFixer::execQueryFileDB(QString file)
{
    QString cmd = QString("SubFixer -Fs ") + file + "| grep '^\\S' | sed '\/erro\r/,+1 d' | tr \/ \" \"";
    pQueryFileDB = new QProcess(this);
    connect(pQueryFileDB, &QProcess::readyReadStandardOutput, this, &SubFixer::returnQueryFileDB);
    pQueryFileDB->start("sh", QStringList() << "-c" << cmd);
}

void SubFixer::returnPackages()
{
    QString outPut = QString(pRepos->readAllStandardOutput());
    QVariantList parent = Utils::beautifer(outPut);
    emit modelReady(parent);
}

void SubFixer::returnNextUpdateList()
{
    QString outPut = QString(pNextUpdateList->readAllStandardOutput());
    QStringList strList = Utils::beautifyLast(outPut);

    QVariantList parent;
    foreach (QString s, strList) {
        parent << s;
    }
    emit modelReady(parent);
}

void SubFixer::returnRepoSummary()
{
    QString outPut = QString(pRepoSummary->readAllStandardOutput());
    QVariantList parent = Utils::beautifer(outPut);
    emit modelReady(parent);
}

void SubFixer::returnNextUpdateSize()
{
    QString outPut = QString(pNextUpdateSize->readAllStandardOutput());
    QVariant parent;
    parent = outPut.split("\n").first();
    emit singleModelReady(parent);
}

void SubFixer::returnLastUpgradeTime()
{
    QString outPut = QString(pLastUpgradeTime->readAllStandardOutput());
    QVariant parent;
    parent = outPut.split("\n").first();
    emit singleModelReady(parent);
}

void SubFixer::returnMyAurHelper()
{
    QString outPut = QString(pMyAurHelper->readAllStandardOutput());
    QVariant parent;
    parent = outPut.split("\n").first();
    emit singleModelReady(parent);
}

void SubFixer::returnQueryFileDB()
{
    QString outPut = QString(pQueryFileDB->readAllStandardOutput());
    QStringList list = Utils::beautifyLast(outPut);
    std::regex word_regex = Utils::getSimplePattern();
    QVariantList parent = Utils::performRegx(word_regex, list);
    emit modelReady(parent);
}
