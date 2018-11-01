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
        color: "#546E7A" //"#eee"
    }

    LinArcxAccordion{

    }

    //    AppTabView {
    //        id: tabView
    //    }

    //    AppMenuBar {
    //        id: mAppMenuBar
    //    }
    Component.onCompleted: {

        //        var component = Qt.createComponent(CStr.tabHomeLink);
        //        tabView.addTab(CStr.home, component);
    }
}
