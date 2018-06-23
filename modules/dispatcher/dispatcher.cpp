#include "modules/dispatcher/dispatcher.h"
#include "modules/deCreator/presenter/deCreator.h"
#include "modules/histogram/presenter/histogram.h"
#include "modules/home/presenter/home.h"
#include "modules/pacman/presenter/pacman.h"
#include "modules/settings/presenter/settings.h"
#include "modules/subFixer/presenter/subFixer.h"
#include <QFont>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QTranslator>
#include <modules/dispatcher/macros/dispatcherMacro.h>
#include <modules/utils/sortFilterProxyModel/sortfilterproxymodel.h>

#include <University_all_include.gen.h>
#include <University_all_include.model_view.gen.h>

Dispatcher::Dispatcher(QApplication& app, QObject* parent)
    : mApp(app)
    , QObject(parent)
    , mEngine(*new QQmlApplicationEngine())
{
    qmlRegisterType<SortFilterProxyModel>(SORT_FILTER_PROXT_NAME_SPACE, 0, 1, SORT_FILTER_PROXT_NAME);

    qmlRegisterType<Home>(HOME_NAME_SPACE, 1, 0, HOME_NAME);
    qmlRegisterType<Settings>(SETTINGS_NAME_SPACE, 1, 0, SETTINGS_NAME);
    qmlRegisterType<Histogram>(HISTOGRAM_NAME_SPACE, 1, 0, HISTOGRAM_NAME);
    qmlRegisterType<Pacman>(PACMAN_NAME_SPACE, 1, 0, PACMAN_NAME);
    qmlRegisterType<SubFixer>(SUBFIXER_NAME_SPACE, 1, 0, SUBFIXER_NAME);
    qmlRegisterType<DeCreator>(DECREATOR_NAME_SPACE, 1, 0, DECREATOR_NAME);

    Settings& settings = *new Settings();
    settings.loadFontFamily();
    settings.loadFontSize();
    settings.loadAppStyle();
    settings.loadOS();

    // QxOrm
    qx::QxSqlDatabase::getSingleton()->setDriverName("QSQLITE");
    qx::QxSqlDatabase::getSingleton()->setDatabaseName("./university.sqlite");
    qx::QxSqlDatabase::getSingleton()->setHostName("localhost");
    qx::QxSqlDatabase::getSingleton()->setUserName("root");
    qx::QxSqlDatabase::getSingleton()->setPassword("");

    QSqlError daoError = qx::dao::create_table<student>();

    qx::IxModel* pModel = new qx::QxModel<student>(); //new model_view::student_model();
    pModel->qxFetchAll_();
    //pModel->qxSave_()

    // Get Engine, rootContext()
    mRootContext = mEngine.rootContext();

    mRootContext->setContextProperty("model", pModel);
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
