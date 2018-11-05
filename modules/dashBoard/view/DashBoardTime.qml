import QtQuick 2.9
import QtQuick.Controls 2.2
import linarcx.gnulium.DashBoard 1.0

import "qrc:/dialogs"
import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/dashBoard/strings/DashBoardStrings.js" as Str

Rectangle {
    id: mParent
    width: (parent.width / 3) * 1
    height: txtCurrentTime.height + txtDateGMT.height + txtDatePersian.height
            + qHeader.height + qAboutUs.height + 20
    radius: 8

    border.width: 1
    border.color: "lightsteelblue"

    FontLoader {
        id: mFont
        source: CStr.fontRadioSpace
    }

    DashBoard {
        id: qDashBoard
    }

    AboutGnulium {
        id: qAboutGnulium
    }

    Rectangle {
        id: qAboutUs
        width: parent.width
        height: 30
        anchors.top: parent.top
        border.color: "lightsteelblue"
        border.width: 1

        Rectangle {
            id: qQt
            width: parent.width / 2
            height: parent.height
            color: "transparent"

            Image {
                id: qImgQt
                source: CStr.imgQT
                anchors.left: parent.left
                anchors.leftMargin: 5
                sourceSize.width: parent.height
                sourceSize.height: parent.height
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: app.aboutQt()
                }
            }
            Text {
                anchors.left: qImgQt.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: CStr.aboutQT
            }
        }
        Rectangle {
            width: parent.width / 2
            height: parent.height
            anchors.left: qQt.right
            color: "transparent"

            Image {
                id: qImgGnulium
                source: CStr.imgGnulium
                anchors.left: parent.left
                anchors.leftMargin: 5
                sourceSize.width: parent.height
                sourceSize.height: parent.height
                antialiasing: true
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: qAboutGnulium.open()
                }
            }

            Text {
                anchors.left: qImgGnulium.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: CStr.aboutGnulium
            }
        }
    }

    Rectangle {
        id: qHeader
        width: parent.width
        height: 30
        color: "#009688"
        anchors.top: qAboutUs.bottom

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
