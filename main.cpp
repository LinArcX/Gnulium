#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>
#include "launcher/presenter/launcher.h"

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    auto root_context = engine.rootContext();
    root_context->setContextProperty("myApplication", &app);

    QTranslator translator;
    //translator.load(":/i18n/persian.qm");
    //app.installTranslator(&translator);

    qmlRegisterType<Launcher>("linarcx.gnulium.launcher", 1, 0, "Launcher");

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    //Dispatcher dispatcher(const &app, const &engine);

    return app.exec();
}
