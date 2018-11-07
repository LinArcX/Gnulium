import QtQuick 2.9
import QtQuick.Controls 2.2

import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/HistogramStrings.js" as Str

Rectangle {
    id: mHistoryPillar
    color: CStr.transparent

    FontLoader {
        id: fontCaviarDreams
        source: CStr.fontCaviarDreams
    }

    Image {
        id: imgSettings
        source: CStr.imgAnalytics
        sourceSize.width: parent.width / 2
        sourceSize.height: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    ScrollView {
        id: mScrollView
        clip: true
        width: parent.width
        height: parent.height - (imgSettings.height + txtInspired + 20)
        padding: Str.padding
        anchors.top: imgSettings.bottom
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        Text {
            id: txtPillarBody
            text: Str.histogramPillarBody
            width: mScrollView.width - Str.padding
            wrapMode: TextArea.Wrap
            font.pixelSize: Str.fontSize
        }
    }
    Text {
        id: txtInspired
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        text: Str.inspiredLink
        font.family: fontCaviarDreams.name
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        onLinkActivated: Qt.openUrlExternally(link)
    }
}
