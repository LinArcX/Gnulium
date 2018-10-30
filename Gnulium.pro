QT += qml quick charts quickcontrols2 widgets
CONFIG += c++11

QMAKE_CXXFLAGS_WARN_OFF -= -Wunused-parameter
VERSION = $$system(git log --pretty=format:'%h' -n 1)
DEFINES += APP_VER=\\\"$$VERSION\\\"
DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += main.cpp \
    $$files(modules/*.cpp, true) \
    $$files(util/cpp/*.cpp, true)

HEADERS += $$files(modules/*.h, true) \
           $$files(util/cpp/*.h, true)

RESOURCES += qml.qrc
TRANSLATIONS = i18n/persian.ts
OTHER_FILES += LICENSE\
            README.md\
            .gitignore

#QMAKE_CXXFLAGS += -lz -ludev

linux:!android{
    LIBS += -L$$PWD/libs/linux/libPci/lib/ -lpci
    INCLUDEPATH += $$PWD/libs/linux/libPci/include
#    DEPENDPATH += $$PWD/libs/linux/libPci/include
    PRE_TARGETDEPS += $$PWD/libs/linux/libPci/lib/libpci.a
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


# QxORM Library
#include($$PWD/../../../../../Software/Linux/Software/QxOrm/QxOrm.pri)
#unix:!macx: LIBS += -L$$PWD/../../../../../Software/Linux/Software/QxOrm/lib/ -lQxOrm
#INCLUDEPATH += $$PWD/../../../../../Software/Linux/Software/QxOrm/include
#DEPENDPATH += $$PWD/../../../../../Software/Linux/Software/QxOrm/include

## University
#unix:!macx: LIBS += -L$$PWD/../../../QxEntityEditor/University/cpp/bin/ -lUniversity
#INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/cpp/bin
#DEPENDPATH += $$PWD/../../../QxEntityEditor/University/cpp/bin
#INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/cpp/include
#DEPENDPATH += $$PWD/../../../QxEntityEditor/University/cpp/include

## University-Model
#unix:!macx: LIBS += -L$$PWD/../../../QxEntityEditor/University/modelview/bin/ -lUniversityModel
#INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/modelview/bin
#DEPENDPATH += $$PWD/../../../QxEntityEditor/University/modelview/bin
#INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/modelview/include
#DEPENDPATH += $$PWD/../../../QxEntityEditor/University/modelview/include




#    CONFIG += link_pkgconfig
#    PKGCONFIG += libprocps libpci#Magick++

#unix: PKGCONFIG += libpci zlib

