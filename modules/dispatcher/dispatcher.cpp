#include <QFont>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QSettings>
#include <QTranslator>

#include "modules/dashBoard/presenter/dashBoard.h"
#include "modules/deCreator/presenter/deCreator.h"
#include "modules/disks/presenter/disks.h"
#include "modules/dispatcher/dispatcher.h"
#include "modules/environments/presenter/environments.h"
#include "modules/histogram/presenter/histogram.h"
#include "modules/pacman/presenter/pacman.h"
#include "modules/ports/presenter/ports.h"
#include "modules/processes/presenter/processes.h"
#include "modules/services/presenter/services.h"
#include "modules/settings/presenter/settings.h"
#include "modules/subFixer/presenter/subFixer.h"
#include "modules/systemdAnalyze/presenter/systemdAnalyze.h"
#include <modules/dispatcher/macros/dispatcherMacro.h>
#include <modules/utils/sortFilterProxyModel/sortfilterproxymodel.h>

//#include <University_all_include.gen.h>
//#include <University_all_include.model_view.gen.h>

Dispatcher::Dispatcher(QGuiApplication& mApp, QObject* parent)
    : QObject(parent)
{

    //app = &mApp;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Fusion");

    registerTypes();

    Settings& settings = *new Settings();
    settings.loadFontFamily();
    settings.loadFontSize();
    settings.loadAppStyle();
    settings.loadOS();

    QQmlApplicationEngine* mEngine = getEngine();
    QQmlContext* mContext = getContext();

    mContext->setContextProperty(DISPATCHER, this);
    mContext->setContextProperty(APP, &mApp);
    mContext->setContextProperty(APP_SETTINGS, &settings);

    mEngine->load(QUrl(QLatin1String(MAIN_QML)));

    // QxOrm
    //    qx::QxSqlDatabase::getSingleton()->setDriverName("QSQLITE");
    //    qx::QxSqlDatabase::getSingleton()->setDatabaseName("./university.sqlite");
    //    qx::QxSqlDatabase::getSingleton()->setHostName("localhost");
    //    qx::QxSqlDatabase::getSingleton()->setUserName("root");
    //    qx::QxSqlDatabase::getSingleton()->setPassword("");

    //    QSqlError daoError = qx::dao::create_table<student>();

    //    qx::IxModel* pModel = new qx::QxModel<student>(); //new model_view::student_model();
    // pModel->qxFetchAll_();
    // pModel->qxSave_()

    //    // Get Engine, rootContext()
    //    mRootContext = mEngine.rootContext();
    //    //mRootContext->setContextProperty("model", pModel);
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
