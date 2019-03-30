import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.pacman 1.0

import "qrc:/components/qml"
import "qrc:/strings/CoreStrings.js" as CStr

Row {
    id: mPacmanTab
    spacing: CStr.rowSpacing
    anchors.fill: parent

    Pacman {
        id: mPacman
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    Rectangle {
        color: CStr.transparent
        height: parent.height
        width: parent.width

        Rectangle {
            id: qDashBoardHeader
            width: parent.width
            height: 30
            anchors.top: parent.top
            color: CStr.accordionItemBackGroundColor

            Image {
                id: qPacmanHeaderImage
                anchors.left: parent.left
                source: CStr.imgPacman
                sourceSize.width: parent.height - 2
                sourceSize.height: parent.height - 2
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: txtHeaderDashBoard
                text: CStr.pacman
                anchors.left: qPacmanHeaderImage.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
                font.family: mFont.name
                font.bold: true
                color: "white"
            }

            Rectangle {
                id: qRectAurHelper
                width: imgAurHelper.width + txtAurHelper.width
                height: parent.height
                anchors.left: txtHeaderDashBoard.right
                anchors.leftMargin: 10
                color: "transparent"

                AnimatedImage {
                    id: gifAurHelper
                    z: 1
                    opacity: 1
                    visible: false
                    width: parent.height
                    height: parent.height
                    source: CStr.gifEllipsis
                    anchors.centerIn: parent
                }

                Image {
                    id: imgAurHelper
                    source: CStr.imgBaby
                    sourceSize.width: parent.height - 5
                    sourceSize.height: parent.height - 5
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                }

                Text {
                    id: txtAurHelper
                    anchors.left: imgAurHelper.right
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"
                }
            }

            Rectangle {
                id: qRectLastUpdateTime
                width: imgLastUpdateTime.width + txtLastUpdateTime.width
                height: parent.height
                anchors.left: qRectAurHelper.right
                anchors.leftMargin: 10
                color: "transparent"

                AnimatedImage {
                    id: gifLastUpdateTime
                    z: 1
                    opacity: 1
                    visible: false
                    width: parent.height
                    height: parent.height
                    source: CStr.gifEllipsis
                    anchors.centerIn: parent
                }

                Image {
                    id: imgLastUpdateTime
                    source: CStr.imgCalendar
                    sourceSize.width: parent.height - 5
                    sourceSize.height: parent.height - 5
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                }

                Text {
                    id: txtLastUpdateTime
                    anchors.left: imgLastUpdateTime.right
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"
                }
            }
        }

        Grid {
            id: mGrid
            width: parent.width
            height: parent.height
            anchors.top: qDashBoardHeader.bottom
            columns: 4
            columnSpacing: 2

            PacmanQueryFileDB {
                width: (parent.width / 4) * 1
                height: (parent.height / 5 * 2)
            }

            PacmanRepositories {
                width: (parent.width / 4) * 1
                height: (parent.height / 5 * 2)
            }

            PacmanUpdatePKGs {
                width: (parent.width / 4) * 1
                height: (parent.height / 5 * 2)
            }

            PacmanSummary {
                width: (parent.width / 4) * 1
                height: (parent.height / 5 * 2)
            }

            //            PacmanPackages{
            //                width: parent.width
            //                height: (parent.height / 5 * 3)
            //            }
        }
    }

    Connections {
        target: mPacman
        onMyAurHelperReady: {
            gifAurHelper.visible = false
            txtAurHelper.text = myAurHelper
        }

        onLastUpdateTimeReady: {
            gifLastUpdateTime.visible = false
            txtLastUpdateTime.text = lastUpdateTime
        }
    }

    Component.onCompleted: {
        gifAurHelper.visible = true
        gifLastUpdateTime.visible = true
        mPacman.execMyAurHelper()
        mPacman.execLastUpgradeTime()
    }
}
