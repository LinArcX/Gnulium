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
#include <modules/settings/presenter/macros/settingsMacro.h>
#include <sys/utsname.h>

using namespace std;

Settings::Settings(QObject* parent)
{
}

void Settings::setSettings(QVariantMap mSettings)
{
    // QVariantMap::const_iterator
    for (auto iter = mSettings.begin(); iter != mSettings.end(); ++iter) {
        QString mKey = iter.key();
        if (mKey == FONT_FAMILY) {
            QFont fontFamily(iter.value().toString());
            QSettings settings(COMPANY_NAME, APP_NAME);
            settings.beginGroup(FONT_GROUP);
            settings.setValue(FONT_FAMILY, fontFamily);
            settings.endGroup();
            loadFontFamily();
        } else if (mKey == FONT_SIZE) {
            int fontSize = iter.value().toInt();
            QSettings settings(COMPANY_NAME, APP_NAME);
            settings.beginGroup(FONT_GROUP);
            settings.setValue(FONT_SIZE, fontSize);
            settings.endGroup();
            loadFontSize();
        } else if (mKey == STYLE) {
            QString appStyle = iter.value().toString();
            QSettings settings(COMPANY_NAME, APP_NAME);
            settings.beginGroup(APP_GROUP);
            settings.setValue(STYLE, appStyle);
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

void Settings::resetSettings()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.clear();
}

void Settings::restartApp()
{
    QProcess::startDetached(QApplication::applicationFilePath());
    exit(12);
}

void Settings::loadOS()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(APP_GROUP);
    QString osName = qvariant_cast<QString>(settings.value(OS));
    if (osName.isEmpty() == true) {
        QProcess pOS;
        pOS.start("sh", QStringList() << "-c" << OS_NAME);
        pOS.waitForFinished();
        std::string osName = std::string(pOS.readAllStandardOutput());
        osName.erase(std::remove(osName.begin(), osName.end(), '\n'), osName.end());
        settings.setValue(OS, QString::fromStdString(osName));
    }
    settings.endGroup();
}

void Settings::loadAppStyle()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(APP_GROUP);
    QString mStyle = qvariant_cast<QString>(settings.value(STYLE, STYLE_IMAGING));
    QQuickStyle::setStyle(mStyle);
    settings.endGroup();
}

void Settings::loadFontSize()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(FONT_GROUP);
    QFont mFont;
    mFont.setPixelSize(qvariant_cast<int>(settings.value(FONT_SIZE, 12)));
    QApplication::setFont(mFont);
    settings.endGroup();
}

void Settings::loadFontFamily()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(FONT_GROUP);
    QFont mFont = qvariant_cast<QFont>(settings.value(FONT_FAMILY, FONT_XM_YEKAN));
    QApplication::setFont(mFont);
    settings.endGroup();
}

QString Settings::getOS()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(APP_GROUP);
    QString osName = qvariant_cast<QString>(settings.value(OS));
    settings.endGroup();
    return osName;
}

QString Settings::appStyleName()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(APP_GROUP);
    QString appStyle = qvariant_cast<QString>(settings.value(STYLE, STYLE_IMAGING));
    settings.endGroup();
    return appStyle;
}

QVariantList Settings::appStyles()
{
    QVariantList fontLists;
    fontLists << "Default"
              << "Imagine"
              << "Fusion"
              << "Material"
              << "Universal";

    return fontLists;
}

int Settings::appStyleIndex()
{
    QString currentAppStyle = appStyleName();
    QVariant qv(currentAppStyle);
    return appStyles().indexOf(qv);
}

QString Settings::fontFamilyName()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(FONT_GROUP);
    QFont fontFamily = qvariant_cast<QFont>(settings.value(FONT_FAMILY, FONT_XM_YEKAN));
    settings.endGroup();
    return fontFamily.family();
}

QVariantList Settings::fontFamilies()
{
    QVariantList fontLists;
    fontLists << "Vazir"
              << "Adele"
              << "XmYekan"
              << "Shabnam"
              << "RadioSpace"
              << "CaviarDreams";

    return fontLists;
}

int Settings::fontFamilyIndex()
{
    QString currentFontFamily = fontFamilyName();
    QVariant qv(currentFontFamily);
    return fontFamilies().indexOf(qv);
}

QString Settings::fontSizeName()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(FONT_GROUP);
    QString fontSize = qvariant_cast<QString>(settings.value(FONT_SIZE, 12));
    settings.endGroup();
    return fontSize;
}

QVariantList Settings::fontSizes()
{
    QVariantList fontLists;
    fontLists << "8"
              << "10"
              << "12"
              << "14"
              << "16";

    return fontLists;
}

int Settings::fontSizeIndex()
{
    QString fontSizeIndex = fontSizeName();
    QVariant qv(fontSizeIndex);
    return fontSizes().indexOf(qv);
}
