QT += qml quick charts quickcontrols2 widgets
CONFIG += c++11
SOURCES += $$files(*.cpp, true)
HEADERS += $$files(*.h, true)
QMAKE_CXXFLAGS_WARN_OFF -= -Wunused-parameter
VERSION = $$system(git log --pretty=format:'%h' -n 1)
DEFINES += APP_VER=\\\"$$VERSION\\\"
DEFINES += QT_DEPRECATED_WARNINGS

TRANSLATIONS = i18n/persian.ts
RESOURCES += qml.qrc
OTHER_FILES += LICENSE\
            README.md\
            .gitignore

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

unix: {
    CONFIG += link_pkgconfig
    PKGCONFIG += libprocps #Magick++
}

# QxORM Library
include($$PWD/../../../../../Software/Linux/Software/QxOrm/QxOrm.pri)
unix:!macx: LIBS += -L$$PWD/../../../../../Software/Linux/Software/QxOrm/lib/ -lQxOrm
INCLUDEPATH += $$PWD/../../../../../Software/Linux/Software/QxOrm/include
DEPENDPATH += $$PWD/../../../../../Software/Linux/Software/QxOrm/include

# University
unix:!macx: LIBS += -L$$PWD/../../../QxEntityEditor/University/cpp/bin/ -lUniversity
INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/cpp/bin
DEPENDPATH += $$PWD/../../../QxEntityEditor/University/cpp/bin
INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/cpp/include
DEPENDPATH += $$PWD/../../../QxEntityEditor/University/cpp/include

# University-Model
unix:!macx: LIBS += -L$$PWD/../../../QxEntityEditor/University/modelview/bin/ -lUniversityModel
INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/modelview/bin
DEPENDPATH += $$PWD/../../../QxEntityEditor/University/modelview/bin
INCLUDEPATH += $$PWD/../../../QxEntityEditor/University/modelview/include
DEPENDPATH += $$PWD/../../../QxEntityEditor/University/modelview/include
