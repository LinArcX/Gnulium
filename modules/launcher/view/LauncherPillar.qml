import QtQuick 2.9
import QtQuick.Controls 2.2
import linarcx.gnulium.launcher 1.0

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/launcher/strings/LauncherStrings.js" as Str

Rectangle{
    id: mLauncherPillar
    color: CStr.transparent

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
        sourceSize.width: parent.width
        sourceSize.height: parent.width
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

    Component{
        id: txtDate
        Text {
            font.family: fontRadioSpace.name
            font.pixelSize: 30
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
                //console.log("Array item:", model[i])
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
