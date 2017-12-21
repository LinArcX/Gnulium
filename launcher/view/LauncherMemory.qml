import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:///util/qml/"
import "/util/js/TableCreator.js" as JS
import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Column {
    id: mLauncherMemory
    spacing: 5
    width: (parent.width / 4) * 1
    height: (parent.height / 3)

    property variant mTable: ({})
    property int mImageSize: Str.imageSize

    Launcher{
        id: mLauncher
    }

    Row{
        Image{
            id: imgTopMemory
            width: mImageSize
            height: mImageSize
            antialiasing: true

            source: CStr.imgRam
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mLauncher.execTopMemory()
                    console.log(Str.topMemoryTitle);
                }
            }
        }

        Rectangle{
            width: mLauncherMemory.width - mImageSize
            height: imgTopMemory.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.topMemoryTitle)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

    }

    Component{
        id: tblTopMemory
        TableView{
            width: parent.width
            height: parent.height - mImageSize
            sortIndicatorVisible: true
            z:-1
            TableViewColumn{
                role: CStr.firstValue; title: qsTr(Str.lmFirst); width: parent.width / 4;
            }
            TableViewColumn{
                role: CStr.secondValue; title: qsTr(Str.lmSecond); width: parent.width / 2;
            }
            TableViewColumn{
                role: CStr.thirdValue; title: qsTr(Str.lmThird); width: parent.width / 4;
            }
        }
    }

    Component{
        id : mTimer
        Timer {
            interval: Str.interval; running: true; repeat: true
            onTriggered:{
                mLauncher.execTopMemory()
                console.log(Str.topMemoryTitle);
            }
        }
    }

    Connections{
        target: mLauncher
        onModelReady:{
            JS.createTable(model, mLauncherMemory, mTable, JS.createThreeModel);
        }
    }

    Component.onCompleted: {
        mTable = tblTopMemory.createObject(mLauncherMemory);
        mLauncher.execTopMemory();
        mTimer.createObject(mLauncherMemory);
    }
}
