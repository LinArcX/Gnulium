import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:/util/qml/"
import "qrc:/util/js/TableCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/launcher/strings/LauncherStrings.js" as Str

Column {
    id: mLauncherBootTime
    spacing: 5
    property variant mTable: ({})
    property int mImageSize: Str.imageSize

    Launcher{
        id: mLauncher
    }

    Row{
        Image{
            id: imgBootTime
            sourceSize.width: mImageSize
            sourceSize.height: mImageSize
            antialiasing: true

            source: CStr.imgAlarmClock
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(Str.bootTiemTitle);
                }
            }
        }

        Rectangle{
            width: mLauncherBootTime.width - mImageSize
            height: imgBootTime.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.bootTiemTitle)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Component{
            id: tblMainInfo
            TableView{
                width: parent.width
                height: parent.height - mImageSize
                sortIndicatorVisible: true
                z: Str.zTable
                TableViewColumn{
                    role: CStr.firstValue; title: qsTr(Str.lbtFirst); width: parent.width / 2;
                }
                TableViewColumn{
                    role:CStr.secondValue; title: qsTr(Str.lbtSecond);width: parent.width / 2;
                }
            }
        }

        Connections{
            target: mLauncher
            onModelReady:{
                JS.createTable(model, mLauncherBootTime, mTable, JS.createTwoModel);
            }
        }

        Component.onCompleted: {
            mTable = tblMainInfo.createObject(mLauncherBootTime);
            mLauncher.execBootTime();
        }
    }
}
