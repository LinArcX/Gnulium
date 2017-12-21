import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:///util/qml/"
import "/util/js/TableCreator.js" as JS
import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Column {
    id: mLauncherInfo
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
            id: imgHardDisk
            width: mImageSize
            height: mImageSize
            antialiasing: true

            source: CStr.imgPalette
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(Str.environmentTitle);
                }
            }
        }

        Rectangle{
            width: mLauncherInfo.width - mImageSize
            height: imgHardDisk.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.environmentTitle)
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
                    role: CStr.firstValue; title: qsTr(Str.liFirst); width: parent.width / 3;
                }
                TableViewColumn{
                    role: CStr.secondValue; title: qsTr(Str.liSecond); width: parent.width / 3 * 2;
                }
            }
        }

        Connections{
            target: mLauncher
            onModelReady:{
                JS.createTable(model, mLauncherInfo, mTable, JS.createTwoModel);
            }
        }

        Component.onCompleted: {
            mTable = tblMainInfo.createObject(mLauncherInfo);
            mLauncher.execMainInfo();
        }
    }
}
