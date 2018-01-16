#ifndef SETTINGS_H
#define SETTINGS_H

#include "modules/utils/macros/PropertyHelper.h"
#include <QObject>
#include <QString>
#include <QVariantList>
#include <QVariantMap>

class Settings : public QObject {
    Q_OBJECT

public:
    explicit Settings(QObject* parent = nullptr);

    Q_INVOKABLE void setSettings(QVariantMap);
    Q_INVOKABLE void resetSettings();
    Q_INVOKABLE static void restartApp();
    Q_INVOKABLE static QString getOS();

    static void loadOS();
    static void loadAppStyle();
    static void loadFontSize();
    static void loadFontFamily();

    QString appStyleName();
    Q_INVOKABLE QVariantList appStyles();
    Q_INVOKABLE int appStyleIndex();

    QString fontFamilyName();
    Q_INVOKABLE QVariantList fontFamilies();
    Q_INVOKABLE int fontFamilyIndex();

    QString fontSizeName();
    Q_INVOKABLE QVariantList fontSizes();
    Q_INVOKABLE int fontSizeIndex();

public slots:

signals:

private:
};

#endif // SETTINGS_H
