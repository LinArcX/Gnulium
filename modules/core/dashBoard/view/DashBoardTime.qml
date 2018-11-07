import QtQuick 2.9
import QtQuick.Controls 2.2
import linarcx.gnulium.DashBoard 1.0

import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/DashBoardStrings.js" as Str

Rectangle {
    id: mParent
    width: (parent.width / 3) * 1 - 5
    height: txtCurrentTime.height + txtDateGMT.height + txtDatePersian.height + qHeader.height + 20
    radius: 8

    border.width: 1
    border.color: "lightsteelblue"

    ////// Popup
    LinArcxDialog {
        id: mPopUp
        mImage: CStr.imgOnion
        mTitle: qsTr(Str.torStatusTitle)
        mBody: qsTr(Str.torStatusPopUp)
    }

    FontLoader {
        id: mFont
        source: CStr.fontRadioSpace
    }

    DashBoard {
        id: qDashBoard
    }

    Rectangle {
        id: qHeader
        width: parent.width
        height: 30
        color: "#009688"
        anchors.top: parent.top

        Image {
            id: mLogo
            source: CStr.imgCalendar
            sourceSize.width: qHeader.height
            sourceSize.height: qHeader.height
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 10
            anchors.leftMargin: 5
            antialiasing: true
        }

        Image {
            id: qImgDashBoardHelp
            source: CStr.imgAsk
            sourceSize.width: 15
            sourceSize.height: 15
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 3
            anchors.topMargin: 3

            states: [
                State {
                    name: "scale"
                    PropertyChanges {
                        target: qImgDashBoardHelp
                        scale: 1.3
                    }
                },
                State {
                    name: "normal"
                    PropertyChanges {
                        target: qImgDashBoardHelp
                        scale: 1
                    }
                }
            ]

            transitions: Transition {
                ScaleAnimator {
                    duration: 100
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: mPopUp.open()
                onEntered: qImgDashBoardHelp.state = "scale"
                onExited: qImgDashBoardHelp.state = "normal"
            }
        }
    }

    Text {
        id: txtCurrentTime
        anchors.top: qHeader.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: mFont.name
        font.pixelSize: 20
    }

    Text {
        id: txtDateGMT
        anchors.top: txtCurrentTime.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
    }

    Text {
        id: txtDatePersian
        anchors.top: txtDateGMT.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 13
    }

    Connections {
        target: qDashBoard

        onCurrentTimeReady: {
            txtCurrentTime.text = currentTime
        }

        onGregorianDateReady: {
            txtDateGMT.text = "<font color=\"orange\" size=\"12\">GMT </font>" + gregorianDate
        }
        onPersianDateReady: {
            txtDatePersian.text = persianDate
        }
    }

    Component.onCompleted: {
        qDashBoard.getCurrentTime()
        qDashBoard.getGregorianDate()
        qDashBoard.getPersianDate()
    }
}
