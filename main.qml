import QtQml 2.2
import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.3

import "qrc:///util/qml/"
import "strings/CoreStrings.js" as CORESTRINGS

ApplicationWindow {
    id : myApp
    visible: true
    width: CORESTRINGS.appWidth
    height: CORESTRINGS.appHeight
    title: qsTr(CORESTRINGS.appName)
    minimumWidth: Screen.width / 3 * 2
    minimumHeight: Screen.height / 3 * 2
    maximumWidth: Screen.width
    maximumHeight: Screen.height

    AppTabView{
        id: tabView
    }

    AppMenuBar{
        id: mAppMenuBar
    }

    Component.onCompleted: {
        var component = Qt.createComponent(CORESTRINGS.tabHomeLink);
        tabView.addTab(CORESTRINGS.home, component);
    }
}
