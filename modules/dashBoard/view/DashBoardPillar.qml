import QtQuick 2.9
import QtQuick.Controls 2.2
import linarcx.gnulium.DashBoard 1.0

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/dashBoard/strings/DashBoardStrings.js" as Str

Rectangle {
    id: mParent
    color: CStr.transparent

    DashBoard {
        id: qDashBoard
    }

    FontLoader {
        id: mFont
        source: CStr.fontRadioSpace
    }

    Image {
        id: imgGnuLinux
        source: CStr.imgGnuLinux
        sourceSize.width: parent.width
        sourceSize.height: parent.width
        anchors.top: parent.top
    }

    ScrollView {
        id: mScrollView
        clip: true
        width: parent.width
        height: parent.height - (2 * imgGnuLinux.height)
        padding: Str.padding
        anchors.top: imgGnuLinux.bottom
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        //ScrollBar.vertical.interactive: true
        Text {
            text: Str.gnuLinux
            width: mScrollView.width - Str.padding
            wrapMode: TextArea.Wrap
            font.pixelSize: Str.fontSize
        }
    }

    Text {
        id: txtDate
        font.family: mFont.name
        font.pixelSize: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: txtDateGMT.top
    }

    Text {
        id: txtDateGMT
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: txtDateDesc.top
    }

    Text {
        id: txtDateDesc
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: txtDatePersian.top
    }

    Text {
        id: txtDatePersian
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.bottom: mParent.bottom
    }

    Connections {
        target: qDashBoard
        onModelReady: {
            for (var i = 0; i < model.length; i++) {
                var node = model[i]
                switch (i) {
                case 0:
                    txtDate.text = node
                    break
                case 1:
                    txtDateGMT.text = "<font color=\"orange\">GMT </font>" + node
                    break
                case 2:
                    txtDateDesc.text = node
                    break
                case 3:
                    txtDatePersian.text = node
                    break
                }
            }
        }
    }

    Component.onCompleted: {
        qDashBoard.execTime()
    }
}
