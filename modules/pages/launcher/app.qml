import QtQml 2.2
import QtQuick 2.10
import QtQuick.Window 2.3
import QtQuick.Controls 2.3

import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr

Window {
    id: window
    property int appWidth: window.width
    property int appHeight: window.height

    visible: true
    title: qsTr(CStr.appName)
    color: CStr.appColor

    LinArcxAccordion {
        id: qAccordion
        z: 2
    }

    Loader {
        id: pageLoader
        width: window.width - 100
        height: parent.height
        anchors.left: qAccordion.right
    }

    Component.onCompleted: {
        window.minimumWidth = Screen.width / 3 * 2
        window.minimumHeight = Screen.height / 3 * 2
        window.maximumWidth = Screen.width
        window.maximumHeight = Screen.height

        window.x = Screen.width / 2 - window.minimumWidth / 2
        window.y = Screen.height / 2 - window.minimumHeight / 2
        pageLoader.source = CStr.dashBoardLink
    }
}
