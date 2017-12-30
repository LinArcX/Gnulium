#include "modules/dispatcher/dispatcher.h"
#include "modules/histogram/presenter/histogram.h"
#include "modules/launcher/presenter/launcher.h"
#include "modules/settings/presenter/settings.h"
#include <QFont>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QTranslator>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <QDebug>

Dispatcher::Dispatcher(QApplication& app, QObject* parent)
    : mApp(app)
    , QObject(parent)
    , mEngine(*new QQmlApplicationEngine())
{
    qmlRegisterType<Launcher>("linarcx.gnulium.launcher", 1, 0, "Launcher");
    qmlRegisterType<Settings>("linarcx.gnulium.settings", 1, 0, "Settings");
    qmlRegisterType<Histogram>("linarcx.gnulium.histogram", 1, 0, "Histogram");

    //QTranslator translator;
    //translator.load(":/i18n/persian.qm");
    //app.installTranslator(&translator);

    Settings settings;
    settings.loadFontFamily();
    settings.loadFontSize();
    settings.loadAppStyle();

    auto mRootContext = mEngine.rootContext();
    mRootContext->setContextProperty("dispatcher", this);
    mRootContext->setContextProperty("app", &mApp);
    mEngine.load(QUrl(QLatin1String("qrc:/main.qml")));
}
