import QtQuick 2.9
import QtQuick.Controls 2.2
import linarcx.gnulium.DashBoard 1.0

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/dashBoard/strings/DashBoardStrings.js" as Str

Rectangle {
    id: mParent
    width: (parent.width / 3) * 1
    height: txtCurrentTime.height + txtDateGMT.height + txtDateDesc.height + txtDatePersian.height

    FontLoader {
        id: mFont
        source: CStr.fontRadioSpace
    }

    DashBoard {
        id: qDashBoard
    }

    Text {
        id: txtCurrentTime
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: mFont.name
        font.pixelSize: 20
    }

    Text {
        id: txtDateGMT
        anchors.top: txtCurrentTime.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: txtDateDesc
        anchors.top: txtDateGMT.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: txtDatePersian
        anchors.top: txtDateDesc.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 15
    }

    Connections {
        target: qDashBoard
        onCurrentTimeReady: {
            txtCurrentTime.text = currentTime
        }

        onGregorianDateReady: {
            txtDateGMT.text = gregorianDate
            //            for (var i = 0; i < model.length; i++) {
            //                var node = model[i]
            //                switch (i) {
            //                case 0:
            //                    txtDate.text = node
            //                    break
            //                case 1:
            //                    txtDateGMT.text = "<font color=\"orange\">GMT </font>" + node
            //                    break
            //                case 2:
            //                    txtDateDesc.text = node
            //                    break
            //                case 3:
            //                    txtDatePersian.text = node
            //                    break
            //                }
            //            }
        }

    }

    Component.onCompleted: {
        qDashBoard.getCurrentTime()
        qDashBoard.getGregorianDate()
    }
}
