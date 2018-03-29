import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import linarcx.gnulium.home 1.0

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/home/strings/HomeStrings.js" as Str

Rectangle {
    id: mParent
    color: CStr.transparent

    Home{
        id: mHome
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    LinArcxPopUp{
        id: mPopUp
        mParent: mHomeTab
        mWidth: appWidth / 2
        mHeight: appHeight / 2
        mImage: CStr.imgNvidia
        mTitle: qsTr(Str.grapchicCardsTitle)
        mBody: qsTr(Str.grapchicCardsPopUp)
    }

    ////// Content
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: contextMenu.popup()
        Menu {
            id: contextMenu
            Action{
                text: "What's This?"
                onTriggered: mPopUp.open();
                icon{
                    source: CStr.imgQuestionMark; width: 20; height: 20
                }
            }
        }
    }

    Rectangle{
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
            source: CStr.imgNvidia
            sourceSize.width: mLogo.height
            sourceSize.height: parent.height
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
        }

        Text {
            id: mLabel
            text: qsTr(Str.grapchicCardsTitle)
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: (mRect.width - mLogo.width - mLabel.width) / 2
        }
    }

    Text {
        id: mData
        antialiasing: true
        font.pixelSize: 15
        font.family: mFont.name
        anchors.bottom: mRect.top
        anchors.right: mRect.right
        anchors.bottomMargin: 5
        anchors.rightMargin: mRect.width / 2 - mData.width / 2
    }

    AnimatedImage{
        id: mGiffy
        z:1
        opacity: 1
        visible: false
        width: mGiffy.height
        height: parent.height - mRect.height
        source: CStr.gifPacman
        anchors.bottom: mRect.top
        anchors.centerIn: parent
    }

    Connections{
        target: mHome
        onSingleModelReady:{
            mGiffy.visible = false;
            mData.text = singleModel;
        }
    }

    Component.onCompleted: {
        mHome.execVGA();
    }
}
