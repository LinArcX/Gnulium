#include "modules/deCreator/presenter/deCreator.h"
#include "modules/deCreator/presenter/macros/deCreatorMacro.h"
#include "modules/utils/utils.h"
#include <QDebug>
#include <QFile>
#include <QString>
#include <QTextStream>
#include <QDir>

using namespace std;

DeCreator::DeCreator(QObject* parent)
{
}

bool fileExists(QString path) {
    QFileInfo check_file(path);
    // check if file exists and if yes: Is it really a file and no directory?
    if (check_file.exists() && check_file.isFile()) {
        return true;
    } else {
        return false;
    }
}

void DeCreator::crateDE(QVariantMap mVars)
{
    auto nameIter = mVars.find(NAME);
    QString name = nameIter.value().toString();
    QString oldPath;

    QString newPath = QDir::homePath() + "/.local/share/applications/" + name + ".desktop";
    if(getOldName()!=""){
         oldPath = QDir::homePath() + "/.local/share/applications/" + getOldName() + ".desktop";
    }
    if(fileExists(oldPath)){
        QFile file(oldPath);
        file.rename(newPath);
    }

    QFile mFile(newPath);
    if (!mFile.open(QFile::WriteOnly | QFile::Text)) {
        qDebug() << "could not open file tor writing.";
        return void();
    }

    QTextStream out(&mFile);
    out << "[Desktop Entry]" << endl << endl;

    for (auto iter = mVars.begin(); iter != mVars.end(); ++iter) {
        QString mKey = iter.key();
        if(mKey == "Exec")
        {
            QString execPath = iter.value().toString().remove(0, 7).simplified();
            out << iter.key() << "=" << execPath << endl;
        }
        else if(mKey == "Icon")
        {
            QString iconPath = iter.value().toString().remove(0, 7).simplified();
            out << iter.key() << "=" << iconPath << endl;
        }else {
            out << mKey << "=" << iter.value().toString() << endl;
        }
    }

    mFile.flush();
    mFile.close();

    emit updateUI();
}
