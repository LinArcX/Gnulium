#include "modules/dispatcher/dispatcher.h"
#include "modules/histogram/presenter/histogram.h"
#include "modules/launcher/presenter/launcher.h"
#include "modules/pacman/presenter/pacman.h"
#include "modules/settings/presenter/settings.h"
#include <QFont>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QTranslator>
#include <modules/dispatcher/macros/dispatcherMacro.h>
#include <modules/utils/sortFilterProxyModel/sortfilterproxymodel.h>

Dispatcher::Dispatcher(QApplication& app, QObject* parent)
    : mApp(app)
    , QObject(parent)
    , mEngine(*new QQmlApplicationEngine())
{
    qmlRegisterType<Launcher>(LAUNCHER_NAME_SPACE, 1, 0, LAUNCHER_NAME);
    qmlRegisterType<Settings>(SETTINGS_NAME_SPACE, 1, 0, SETTINGS_NAME);
    qmlRegisterType<Histogram>(HISTOGRAM_NAME_SPACE, 1, 0, HISTOGRAM_NAME);
    qmlRegisterType<Pacman>(PACMAN_NAME_SPACE, 1, 0, PACMAN_NAME);
    qmlRegisterType<SortFilterProxyModel>(SORT_FILTER_PROXT_NAME_SPACE, 0, 1, SORT_FILTER_PROXT_NAME);

    Settings& settings = *new Settings();
    settings.loadFontFamily();
    settings.loadFontSize();
    settings.loadAppStyle();
    settings.loadOS();

    mRootContext = mEngine.rootContext();

    mRootContext->setContextProperty(DISPATCHER, this);
    mRootContext->setContextProperty(APP, &mApp);
    mRootContext->setContextProperty(APP_SETTINGS, &settings);
    mEngine.load(QUrl(QLatin1String(MAIN_QML)));
}

void Dispatcher::loadLanguage()
{
    //QTranslator translator;
    //translator.load(":/i18n/persian.qm");
    //app.installTranslator(&translator);
}

void Dispatcher::getAppFeatures()
{
    //int size = mApp.screens().size();
    //QScreen::availableSize().width();
    //int i = scr.availableSize().width();

    //    QObject* root = mEngine.rootObjects()[0];
    //    QQuickWindow* window = qobject_cast<QQuickWindow*>(root);
    //    QQuickWindow& windowRef = (QQuickWindow&)window;
    //    QObject *rect = root->findChild<QObject*>("saeedApp");
    //    mRootContext->setContextProperty("myWindows", &windowRef);
}
