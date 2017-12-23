import QtQuick 2.9
import QtQuick.Controls 2.2
import linarcx.gnulium.launcher 1.0

import "qrc:///util/qml/"
import "/util/js/TableCreator.js" as JS
import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Rectangle{
    id: mLauncherPillar
    width: parent.width / 5 * 1
    height: parent.height
    color: CStr.transparent
    property variant date;
    property variant dateGMT;
    property variant dateDesc;
    property variant datePersian;

    Launcher{
        id: mLauncher
    }

    FontLoader {
        id: fontRadioSpace
        source: CStr.fontRadioSpace
    }

    Image {
        id: imgGnuLinux
        source: CStr.imgGnuLinux
        width: parent.width
        height: parent.width
    }

    Rectangle {
        id: frame
        clip: true
        width: parent.width
        height: 100
        color: CStr.transparent
        //border.color: "green"
        anchors.top: imgGnuLinux.bottom

        Text {
            id: content
            padding: 10
            text: Str.gnuLinux
            width: parent.width
            wrapMode: TextArea.Wrap
            font.pixelSize: 12
            x: -hbar.position * width
            y: -vbar.position * height
        }

        ScrollBar {
            id: vbar
            hoverEnabled: true
            active: true//hovered || pressed
            orientation: Qt.Vertical
            size: frame.height / content.height
            onHoveredChanged: active=true;
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

        ScrollBar {
            id: hbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Horizontal
            size: frame.width / content.width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }
    Component{
        id: txtDate
        Text {
            id: mTxtDate
            font.family: fontRadioSpace.name
            font.pixelSize: 30
            //anchors.top: frame.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Component{
        id: txtDateGMT
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Component{
        id: txtDateDesc
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Component{
        id: txtDatePersian
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }
    }

    Connections{
        target: mLauncher
        onModelReady:{
            var mText;
            var mTextGMT;
            var mTextDesc;
            var mTextDatePersian;
            for (var i=0; i< model.length; i++){
                var node = model[i];
                switch(i) {
                case 0:
                    mText = txtDate.createObject(mLauncherPillar);
                    mText.text = node
                    break;
                case 1:
                    mTextGMT = txtDateGMT.createObject(mLauncherPillar);
                    mTextGMT.text = "<font color=\"orange\">GMT </font>" + node;
                    break;
                case 2:
                    mTextDesc = txtDateDesc.createObject(mLauncherPillar);
                    mTextDesc.text = node
                    break;
                case 3:
                    mTextDatePersian = txtDatePersian.createObject(mLauncherPillar);
                    mTextDatePersian.text = node
                    break;
                }
                console.log("Array item:", model[i])
            }
            mTextDatePersian.anchors.bottom = mLauncherPillar.bottom;
            mTextDesc.anchors.bottom = mTextDatePersian.top;
            mTextGMT.anchors.bottom = mTextDesc.top
            mText.anchors.bottom = mTextGMT.top
        }
    }

    Component.onCompleted: {
        mLauncher.execTime();
    }
}
