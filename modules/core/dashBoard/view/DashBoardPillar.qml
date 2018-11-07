import QtQuick 2.9
import QtQuick.Controls 2.2

import "qrc:/components/qml/"
import "qrc:/CoreStrings.js" as CStr
import "qrc:/strings/DashBoardStrings.js" as Str

Rectangle {
    id: mParent
    color: CStr.transparent

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
}
