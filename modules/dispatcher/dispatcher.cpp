#include "modules/dispatcher/dispatcher.h"
#include "modules/histogram/presenter/histogram.h"
#include "modules/launcher/presenter/launcher.h"
#include "modules/settings/presenter/settings.h"
#include <QDebug>
#include <QFont>
#include <QProcess>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QTranslator>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <modules/dispatcher/macros/dispatcherMacro.h>

Dispatcher::Dispatcher(QApplication& app, QObject* parent)
    : mApp(app)
    , QObject(parent)
    , mEngine(*new QQmlApplicationEngine())
{
    qmlRegisterType<Launcher>(LAUNCHER_NAME_SPACE, 1, 0, LAUNCHER_NAME);
    qmlRegisterType<Settings>(SETTINGS_NAME_SPACE, 1, 0, SETTINGS_NAME);
    qmlRegisterType<Histogram>(HISTOGRAM_NAME_SPACE, 1, 0, HISTOGRAM_NAME);

    //QTranslator translator;
    //translator.load(":/i18n/persian.qm");
    //app.installTranslator(&translator);

    Settings settings;
    settings.loadFontFamily();
    settings.loadFontSize();
    settings.loadAppStyle();

    auto mRootContext = mEngine.rootContext();
    mRootContext->setContextProperty(DISPATCHER, this);
    mRootContext->setContextProperty(APP, &mApp);
    mEngine.load(QUrl(QLatin1String(MAIN_QML)));
}
