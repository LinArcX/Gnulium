import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:/util/qml/"
import "qrc:/util/js/TableCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/launcher/strings/LauncherStrings.js" as Str

Rectangle {
    id: mLauncherUpTime
    color: CStr.transparent
    property variant mText

    Component{
        id : mTimer
        Timer {
            interval: Str.interval; running: true; repeat: true
            onTriggered:{
                mLauncher.execUpTime();
                console.log(Str.upTimeTitle);
            }
        }
    }

    Launcher{
        id: mLauncher
    }

    Image{
        id: imgBootTime
        source: CStr.imgHourGlass
        antialiasing: true
        anchors.left: parent.left
        sourceSize.width: parent.height / 2
        sourceSize.height: parent.height / 2
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: lblSystemAge
        text: qsTr(Str.upTime)
        anchors.left: imgBootTime.right
        anchors.verticalCenter: parent.verticalCenter
    }

    Component{
        id: txtUpTime
        Text {
            anchors.left: lblSystemAge.right
            anchors.top: lblSystemAge.top
            font.pixelSize: 17
            font.family: fontRadioSpace.name
            antialiasing: true
        }
    }

    FontLoader {
        id: fontRadioSpace
        source: CStr.fontCaviarDreams
    }

    Connections{
        target: mLauncher
        onSingleModelReady:{
            mText.text = singleModel;
        }
    }

    Component.onCompleted: {
        mLauncher.execUpTime();
        mText = txtUpTime.createObject(mLauncherUpTime);
        mTimer.createObject(mLauncherUpTime);
    }
}
