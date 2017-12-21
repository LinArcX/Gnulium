#include "util/headers/utils.h"
#include <QString>
#include <QDebug>

    static QString DESTRUCTOR_MSG = QStringLiteral("Running the %1 destructor.");


    void Utils::DestructorMsg(const QString value)
    {
        qDebug() << DESTRUCTOR_MSG.arg(value);
    }

    void Utils::DestructorMsg(const QObject * const object)
    {
        DestructorMsg(object->metaObject()->className());
    }



