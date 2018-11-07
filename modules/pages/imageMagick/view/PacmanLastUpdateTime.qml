import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import linarcx.gnulium.pacman 1.0

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/pacman/strings/PacmanStrings.js" as Str

Rectangle {
    id: mParent
    color: CStr.transparent

    Pacman{
        id: mPacman
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    Popup {
        id: mPopUp
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        width: appWidth / 2
        height: appHeight / 2
        parent: mPacmanTab

        x: mPacmanTab.width / 2 - mPopUp.width / 2
        y: mPacmanTab.height / 2 - mPopUp.height / 2

        enter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 200 }
            NumberAnimation { property: "y"; from: y; to: y + 10; duration: 200 }
        }

        Image {
            id: imgClose
            x: -20
            y: -20
            source: CStr.imgClose
            sourceSize.width: 20
            sourceSize.height: 20
            z: 1
            states: [
                State {
                    name: "scale"
                    PropertyChanges { target: imgClose; scale: 1.3; }
                },
                State {
                    name: "normal"
                    PropertyChanges { target: imgClose; scale: 1; }
                }
            ]

            transitions: Transition {
                ScaleAnimator { duration: 100; }
            }

            MouseArea{
                hoverEnabled: true
                anchors.fill: parent
                onClicked: mPopUp.close();
                onEntered: imgClose.state = "scale";
                onExited: imgClose.state = "normal";
            }
        }

        Rectangle{
            anchors.fill: parent

            Image {
                id: imgPopUp
                source: CStr.imgCalendar
                sourceSize.width: 40
                sourceSize.height: 40
                anchors.margins: 20
                anchors.top: parent.top
                anchors.left: parent.left
                antialiasing: true
            }

            Text {
                text: qsTr(Str.lastUpdateTime)
                anchors.margins: 20
                anchors.right: parent.right
                anchors.top: parent.top
                font.family: mFont.name
                font.pixelSize: 30
            }

            Rectangle{
                id: spacer
                width: parent.width - 20
                height: 3
                color: "#999"
                anchors.top: imgPopUp.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: qsTr(Str.lastUpdatePopUp)
                font.pixelSize: 15
                width: mPopUp.width - 60
                wrapMode: TextArea.Wrap
                anchors.top: spacer.bottom
                anchors.left: parent.left
                anchors.margins: 10
            }
        }
    }

    ////// Content
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: contextMenu.popup()
        Menu {
            id: contextMenu
            Action{
                text: "Clear"
                onTriggered:{
                    mLabel.text = "";
                    mGiffy.visible = false;
                    mButton.opacity = 1;
                    mButton.enabled = true;
                }
                icon{
                    source: CStr.imgSweep; width: 20; height: 20
                }
            }
            Action{
                text: "What's This?"
                onTriggered: mPopUp.open();
                icon{
                    source: CStr.imgQuestionMark; width: 20; height: 20
                }
            }
        }
    }

    Button {
        id: mButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: Str.lastUpdateTime
        implicitWidth: mParent.width / 4 * 3
        anchors.rightMargin: mParent.width / 2 - mButton.width / 2
        anchors.leftMargin: mParent.width / 2 - mButton.width / 2
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

        onClicked: {
            mLabel.text = "";
            mGiffy.visible = true;
            mButton.opacity = 0.5;
            mButton.enabled = false;
            mPacman.execLastUpgradeTime();
        }

        Image {
            id: image
            fillMode: Image.PreserveAspectFit
            height: sourceSize.height
            source: CStr.imgCalendar
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

    AnimatedImage{
        id: mGiffy
        z:1
        opacity: 1
        visible: false
        width: mGiffy.height
        height: parent.height - mButton.height
        source: CStr.gifLoader
        anchors.bottom: mButton.top
        anchors.centerIn: parent
    }

    Connections{
        target: mPacman
        onSingleModelReady:{
            mGiffy.visible = false;
            mButton.opacity = 1;
            mButton.enabled = true;
            mLabel.text = singleModel;
        }
    }

    Component.onCompleted: {
        mLabel.text = "";
        mGiffy.visible = true;
        mButton.opacity = 0.5;
        mButton.enabled = false;
        mPacman.execLastUpgradeTime();
    }
}
