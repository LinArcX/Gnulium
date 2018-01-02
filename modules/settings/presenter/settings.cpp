#include "modules/settings/presenter/settings.h"
#include "modules/dispatcher/dispatcher.h"
#include <QApplication>
#include <QDebug>
#include <QFont>
#include <QProcess>
#include <QQuickStyle>
#include <QSettings>
#include <QString>
#include <QStringList>
#include <QStyleFactory>

using namespace std;

Settings::Settings(QObject* parent)
{
    //history 50 | awk '{h[$2]++}END{for(i in h){print h[i],i|"sort -rn|head -20"}}'

    //iwgetid -r; cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address;
}

void Settings::setSettings(QVariantMap mSettings)
{
    // QVariantMap::const_iterator
    for (auto iter = mSettings.begin(); iter != mSettings.end(); ++iter) {
        QString mKey = iter.key();
        if (mKey == "fontFamily") {
            QFont fontFamily(iter.value().toString());
            QSettings settings("io.github.linarcx", "gnulium");
            settings.beginGroup("Font");
            settings.setValue("font-family", fontFamily);
            settings.endGroup();
            loadFontFamily();
        } else if (mKey == "fontSize") {
            int fontSize = iter.value().toInt();
            QSettings settings("io.github.linarcx", "gnulium");
            settings.beginGroup("Font");
            settings.setValue("font-size", fontSize);
            settings.endGroup();
            loadFontSize();
        } else if (mKey == "style") {
            QString appStyle = iter.value().toString();
            QSettings settings("io.github.linarcx", "gnulium");
            settings.beginGroup("App");
            settings.setValue("style", appStyle);
            settings.endGroup();
            loadAppStyle();
        }/* else if (mKey == "style_night") {
            QString appStyle = iter.value().toString();
            QSettings settings("io.github.linarcx", "gnulium");
            settings.beginGroup("Interface Mode");
            settings.setValue("style_night", appStyle);
            settings.endGroup();
            loadAppStyle();


            Add first step to nightMode
            Need time for creating new several files, also
            New style qml

            State: Working On it .....
        }*/
    }
}

void Settings::loadFontFamily()
{
    QSettings settings("io.github.linarcx", "gnulium");
    settings.beginGroup("Font");
    QFont mFont = qvariant_cast<QFont>(settings.value("font-family", "XmYekan"));
    QApplication::setFont(mFont);
    settings.endGroup();
}

void Settings::loadFontSize()
{
    QSettings settings("io.github.linarcx", "gnulium");
    settings.beginGroup("Font");
    QFont mFont;
    mFont.setPixelSize(qvariant_cast<int>(settings.value("font-size", 12)));
    QApplication::setFont(mFont);
    settings.endGroup();
}

void Settings::loadAppStyle()
{
    QSettings settings("io.github.linarcx", "gnulium");
    settings.beginGroup("App");
    QString mStyle = qvariant_cast<QString>(settings.value("style", "Imagine"));
    QQuickStyle::setStyle(mStyle);
    settings.endGroup();
}

void Settings::restartApp()
{
    QProcess::startDetached(QApplication::applicationFilePath());
    exit(12);
}
