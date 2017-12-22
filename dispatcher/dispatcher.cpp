#include "dispatcher/dispatcher.h"
#include "launcher/presenter/launcher.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>

Dispatcher::Dispatcher(QApplication& app, QObject* parent)
    : mApp(app)
    , QObject(parent)
    , mEngine(*new QQmlApplicationEngine())
{
    qmlRegisterType<Launcher>("linarcx.gnulium.launcher", 1, 0, "Launcher");

    //QTranslator translator;
    //translator.load(":/i18n/persian.qm");
    //app.installTranslator(&translator);

    auto mRootContext = mEngine.rootContext();
    mRootContext->setContextProperty("dispatcher", this);
    mRootContext->setContextProperty("app", &mApp);
    mEngine.load(QUrl(QLatin1String("qrc:/main.qml")));
}
