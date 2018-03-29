import QtQuick 2.9
import QtQuick.Controls 2.2

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/deCreator/strings/DeCreatorStrings.js" as Str

Rectangle {
    color: CStr.transparent

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    Image {
        id: imgPillar
        source: CStr.imgDesktopEntry
        sourceSize.width: parent.width / 2
        sourceSize.height: parent.width / 2
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ScrollView {
        id: mScrollView
        clip: true
        width: parent.width
        height: parent.height - (imgPillar.height + txtInspired.height + 20)
        padding: Str.padding
        anchors.top: imgPillar.bottom
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        Text {
            text: Str.dePillarBody
            width: mScrollView.width - Str.padding
            wrapMode: TextArea.Wrap
            font.pixelSize: Str.fontSize
        }
    }

    Text {
        id: txtInspired
        text: Str.inspiredLink
        font.family: mFont.name
        font.bold: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onLinkActivated: Qt.openUrlExternally(link)
    }
}
