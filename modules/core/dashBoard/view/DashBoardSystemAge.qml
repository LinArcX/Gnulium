import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import linarcx.gnulium.DashBoard 1.0

import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/DashBoardStrings.js" as Str

Rectangle {
    id: mParent
    color: CStr.transparent

    DashBoard {
        id: qDashBoard
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    LinArcxDialog {
        id: mPopUp
        mImage: CStr.imgMan
        mTitle: qsTr(Str.systemAgeTitle)
        mBody: qsTr(Str.systemAgePopUp)
    }

    Rectangle {
        id: mRect
        color: "#BDBDBD"
        radius: 5
        width: parent.width / 4 * 3
        height: parent.height / 2
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.rightMargin: parent.width / 2 - mRect.width / 2
        anchors.leftMargin: parent.width / 2 - mRect.width / 2

        Image {
            id: mLogo
            source: CStr.imgMan
            sourceSize.width: mLogo.height
            sourceSize.height: parent.height
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
        }

        Text {
            id: mLabel
            text: qsTr(Str.systemAgeTitle)
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: (mRect.width - mLogo.width - mLabel.width) / 2
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
        id: mData
        antialiasing: true
        font.pixelSize: 15
        font.family: mFont.name
        anchors.bottom: mRect.top
        anchors.right: mRect.right
        anchors.bottomMargin: -10
        anchors.rightMargin: mRect.width / 2 - mData.width / 2
    }

    AnimatedImage {
        id: mGiffy
        z: 1
        opacity: 1
        visible: false
        width: mGiffy.height
        height: parent.height - mRect.height
        source: CStr.gifEllipsis
        anchors.bottom: mRect.top
        anchors.centerIn: parent
    }


    //    Component {
    //        id: mTimer
    //        Timer {
    //            interval: Str.interval
    //            running: true
    //            repeat: true
    //            onTriggered: {
    //                qDashBoard.getArchAge()
    //            }
    //        }
    //    }
    Connections {
        target: qDashBoard
        onArchAgeReady: {
            mGiffy.visible = false
            mData.text = archAge
        }
    }

    Component.onCompleted: {
        mGiffy.visible = true
        qDashBoard.getArchAge()
        //        mTimer.createObject(mParent)
    }
}
