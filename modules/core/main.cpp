#include "modules/core/dispatcher/dispatcher.h"
#include <QApplication>
#include <stdio.h>

#include "libs/linux/libPci/include/pci/pci.h"

int main(int argc, char* argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    Dispatcher dispatcher(app);
    return app.exec();
}
