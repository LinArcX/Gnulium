#include <QFont>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QSettings>
#include <QSplashScreen>
#include <QTranslator>

#include "modules/core/dashBoard/presenter/dashBoard.h"
#include "modules/core/dispatcher/dispatcher.h"
#include "modules/pages/desktopEntryCreator/presenter/desktopEntryCreator.h"
#include "modules/pages/disks/presenter/disks.h"
#include "modules/pages/environments/presenter/environments.h"
#include "modules/pages/histogram/presenter/histogram.h"
#include "modules/pages/pacman/presenter/pacman.h"
#include "modules/pages/ports/presenter/ports.h"
#include "modules/pages/processes/presenter/processes.h"
#include "modules/pages/services/presenter/services.h"
#include "modules/pages/settings/presenter/settings.h"
#include "modules/pages/subTitleFixer/presenter/subTitleFixer.h"
#include "modules/pages/systemdAnalyze/presenter/systemdAnalyze.h"
#include <modules/core/dispatcher/dispatcherMacro.h>
#include <util/cpp/sortFilterProxyModel/sortfilterproxymodel.h>

Dispatcher::Dispatcher(QGuiApplication& mApp, QObject* parent)
    : QObject(parent)
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Imagine");

    // Load Splash Screen
    QQmlApplicationEngine* mEngine = getEngine();
    mEngine->load(QUrl(QLatin1String(MAIN_QML)));
    QQmlContext* mContext = getContext();

    registerTypes();

    Settings& settings = *new Settings();
    settings.loadFontFamily();
    settings.loadFontSize();
    settings.loadAppStyle();
    settings.loadOS();

    mContext->setContextProperty(DISPATCHER, this);
    mContext->setContextProperty(APP, &mApp);
    mContext->setContextProperty(APP_SETTINGS, &settings);
}

void Dispatcher::registerTypes()
{
    qmlRegisterType<DashBoard>("linarcx.gnulium.DashBoard", 1, 0, "DashBoard");
    qmlRegisterType<Settings>("linarcx.gnulium.settings", 1, 0, "Settings");
    qmlRegisterType<Histogram>("linarcx.gnulium.histogram", 1, 0, "Histogram");
    qmlRegisterType<Pacman>("linarcx.gnulium.pacman", 1, 0, "Pacman");
    qmlRegisterType<SubFixer>("linarcx.gnulium.subFixer", 1, 0, "SubFixer");
    qmlRegisterType<DeCreator>("linarcx.gnulium.deCreator", 1, 0, "DeCreator");
    qmlRegisterType<Processes>("linarcx.gnulium.Processes", 1, 0, "Processes");
    qmlRegisterType<Services>("linarcx.gnulium.Services", 1, 0, "Services");
    qmlRegisterType<Disks>("linarcx.gnulium.Disks", 1, 0, "Disks");
    qmlRegisterType<Environments>("linarcx.gnulium.Environments", 1, 0, "Environments");
    qmlRegisterType<SystemdAnalyze>("linarcx.gnulium.SystemdAnalyze", 1, 0, "SystemdAnalyze");
    qmlRegisterType<Ports>("linarcx.gnulium.Ports", 1, 0, "Ports");
    qmlRegisterType<SortFilterProxyModel>("linarcx.gnulium.sortFilterProxyModel", 0, 1, "SortFilterProxyModel");
}
