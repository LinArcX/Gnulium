import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import linarcx.gnulium.pacman 1.0

import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/PacmanStrings.js" as Str

Rectangle {
    id: mParent
    color: CStr.transparent

    Pacman {
        id: mPacman
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    LinArcxPopUp {
        id: mPopUp
        mParent: mPacmanTab
        mWidth: appWidth / 2
        mHeight: appHeight / 2
        mImage: CStr.imgAccumulator
        mTitle: qsTr(Str.nextUpdateSize)
        mBody: qsTr(Str.nextUpdateHint)
    }

    ////// Content
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: contextMenu.popup()
        Menu {
            id: contextMenu
            Action {
                text: "Stop"
                onTriggered: {
                    mLabel.text = ""
                    mGiffy.visible = false
                    mButton.opacity = 1
                    mButton.enabled = true
                }

                icon {
                    source: CStr.imgStop
                    width: 20
                    height: 20
                }
            }
            Action {
                text: "What's This?"
                onTriggered: mPopUp.open()
                icon {
                    source: CStr.imgQuestionMark
                    width: 20
                    height: 20
                }
            }
        }
    }

    Button {
        id: mButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: Str.nextUpdateSize
        implicitWidth: mParent.width / 4 * 3
        anchors.rightMargin: mParent.width / 2 - mButton.width / 2
        anchors.leftMargin: mParent.width / 2 - mButton.width / 2
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

        onClicked: {
            mLabel.text = ""
            mGiffy.visible = true
            mButton.opacity = 0.5
            mButton.enabled = false
            mPacman.execNextUpdateSize()
        }

        Image {
            id: image
            fillMode: Image.PreserveAspectFit
            height: sourceSize.height
            source: CStr.imgAccumulator
            sourceSize.height: mButton.background.height
            anchors.left: parent.left
        }
    }

    Text {
        id: mLabel
        antialiasing: true
        font.pixelSize: 17
        font.family: mFont.name
        anchors.bottom: mButton.top
        anchors.right: mButton.right
        anchors.bottomMargin: mButton.height / 2 - mLabel.height / 2
        anchors.rightMargin: mButton.width / 2 - mLabel.width / 2
    }

    AnimatedImage {
        id: mGiffy
        z: 1
        opacity: 1
        visible: false
        width: mGiffy.height
        height: parent.height - mButton.height
        source: CStr.gifPacman
        anchors.bottom: mButton.top
        anchors.centerIn: parent
    }

    Connections {
        target: mPacman
        onSingleModelReady: {
            mGiffy.visible = false
            mButton.opacity = 1
            mButton.enabled = true
            mLabel.text = singleModel
        }
    }
}
