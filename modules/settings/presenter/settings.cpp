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
        }
    }
}

void Settings::loadFontFamily()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(FONT_GROUP);
    QFont mFont = qvariant_cast<QFont>(settings.value(FONT_FAMILY, FONT_XM_YEKAN));
    QApplication::setFont(mFont);
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

void Settings::loadAppStyle()
{
    QSettings settings(COMPANY_NAME, APP_NAME);
    settings.beginGroup(APP_GROUP);
    QString mStyle = qvariant_cast<QString>(settings.value(STYLE, STYLE_IMAGING));
    QQuickStyle::setStyle(mStyle);
    settings.endGroup();
}

void Settings::restartApp()
{
    QProcess::startDetached(QApplication::applicationFilePath());
    exit(12);
}
