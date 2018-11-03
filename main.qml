import QtQml 2.2
import QtQuick 2.10
import QtQuick.Window 2.3
import QtQuick.Controls 2.3

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr

ApplicationWindow {
    id: myApp
    property int appWidth: myApp.width
    property int appHeight: myApp.height
    property int appX: myApp.x
    property int appY: myApp.y

    visible: true
    title: qsTr(CStr.appName)
    minimumWidth: Screen.width / 3 * 2
    minimumHeight: Screen.height / 3 * 2
    maximumWidth: Screen.width
    maximumHeight: Screen.height

    background: Rectangle {
        anchors.fill: parent
        color: CStr.appColor //"#eee"
    }

    LinArcxAccordion {
        id: qAccordion
        z: 2
    }

    Loader {
        width: myApp.width - 100
        anchors.left: qAccordion.right
        height: parent.height
        id: pageLoader
    }

    Component.onCompleted: {
        pageLoader.source = CStr.dashBoardLink
    }
}
