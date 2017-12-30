#ifndef SETTINGS_H
#define SETTINGS_H

#include "modules/utils/macros/PropertyHelper.h"
#include <QObject>
#include <QString>
#include <QVariantMap>

class Settings : public QObject {
    Q_OBJECT

public:
    explicit Settings(QObject* parent = nullptr);
    Q_INVOKABLE void setSettings(QVariantMap);
    static void loadFontFamily();
    static void loadFontSize();
    static void loadAppStyle();
    Q_INVOKABLE static void restartApp();

public slots:

signals:

private:
};

#endif // SETTINGS_H
