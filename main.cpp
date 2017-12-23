#include "dispatcher/dispatcher.h"
#include <QApplication>
#include <QFont>

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QFont font("XmYekan");
    font.setPixelSize(13);
    //font.setStyleHint(QFont::Helvetica);
    QApplication::setFont(font);

    Dispatcher dispatcher(app);
    //    if (dispatcher.getEngine().rootObjects().isEmpty())
    //        return -1;
    return app.exec();
}
