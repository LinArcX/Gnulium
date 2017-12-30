import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/launcher/strings/LauncherStrings.js" as Str

Rectangle {
    id: mLauncherArchAge
    width: parent.width / 2
    height: parent.height
    color: CStr.transparent

    Launcher{
        id: mLauncher
    }

    Image{
        id: imgBootTime
        source: CStr.imgMan
        antialiasing: true
        anchors.left: parent.left
        sourceSize.width: parent.height / 3 * 2
        sourceSize.height: parent.height / 3 * 2
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: lblSystemAge
        text: qsTr(Str.systemAge)
        anchors.left: imgBootTime.right
        anchors.verticalCenter: parent.verticalCenter
    }

    FontLoader {
        id: fontRadioSpace
        source: CStr.fontCaviarDreams
    }

    Component{
        id: txtArchAge
        Text {
            anchors.left: lblSystemAge.right
            anchors.top: lblSystemAge.top
            font.pixelSize: 17
            font.family: fontRadioSpace.name
            antialiasing: true
        }
    }

    Connections{
        target: mLauncher
        onSingleModelReady:{
            var mText = txtArchAge.createObject(mLauncherArchAge);
            mText.text = singleModel;
        }
    }

    Component.onCompleted: {
        mLauncher.execArchAge();
    }
}
