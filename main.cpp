#include "dispatcher/dispatcher.h"
#include <QApplication>

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    Dispatcher dispatcher(app);
    //    if (dispatcher.getEngine().rootObjects().isEmpty())
    //        return -1;
    return app.exec();
}
