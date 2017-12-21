import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:///util/qml/"
import "/util/js/TableCreator.js" as JS
import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Column {
    id: mLauncherProcess
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
            id: imgCpu
            width: mImageSize
            height: mImageSize
            antialiasing: true

            source: CStr.imgChip
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mLauncher.execTopProcess()
                    console.log(Str.topProcessTitle);
                }
            }
        }

        Rectangle{
            width: mLauncherProcess.width - mImageSize
            height: imgCpu.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.topProcessTitle)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

    }

    Component{
        id: tblTopProcess
        TableView{
            width: parent.width
            height: parent.height - mImageSize
            sortIndicatorVisible: true
            z:-1
            TableViewColumn{
                role: CStr.firstValue; title: qsTr(Str.lpFirst); width: parent.width / 4;
            }
            TableViewColumn{
                role: CStr.secondValue; title: qsTr(Str.lpSecond); width: parent.width / 2;
            }
            TableViewColumn{
                role: CStr.thirdValue; title: qsTr(Str.lpThird); width: parent.width / 4;
            }
        }
    }

    Component{
        id : mTimer
        Timer {
            interval: Str.interval; running: true; repeat: true
            onTriggered:{
                mLauncher.execTopProcess()
                console.log(Str.topProcessTitle);
            }
        }
    }

    Connections{
        target: mLauncher
        onModelReady:{
            JS.createTable(model, mLauncherProcess, mTable, JS.createThreeModel);
        }
    }

    Component.onCompleted: {
        mTable = tblTopProcess.createObject(mLauncherProcess);
        mLauncher.execTopProcess();
        mTimer.createObject(mLauncherProcess);
    }

}
