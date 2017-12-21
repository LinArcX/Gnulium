import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:///util/qml/"
import "/util/js/TableCreator.js" as JS
import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Column {
    id: mLauncherHardDisk
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

            source: CStr.imgHardDisk
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mLauncher.execHardDisk()
                    console.log(Str.hardDiskTitle);
                }
            }
        }

        Rectangle{
            width: mLauncherHardDisk.width - mImageSize
            height: imgHardDisk.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.hardDiskTitle)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Component{
            id: tblHardDisk
            TableView{
                width: parent.width
                height: parent.height - mImageSize
                sortIndicatorVisible: true
                z: Str.zTable
                TableViewColumn{
                    role: CStr.firstValue; title: qsTr(Str.lhdFirst); width: parent.width / 3;
                }
                TableViewColumn{
                    role: CStr.secondValue; title: qsTr(Str.lhdSecond); width: parent.width / 3;
                }
                TableViewColumn{
                    role: CStr.thirdValue; title: qsTr(Str.lhdThird); width: parent.width / 3;
                }
                TableViewColumn{
                    role: CStr.forthValue; title: qsTr(Str.lhdForth); width: parent.width / 3;
                }
                TableViewColumn{
                    role: CStr.fifthValue; title: qsTr(Str.lhdFifth); width: parent.width / 3;
                }
                TableViewColumn{
                    role: CStr.sixthValue; title: qsTr(Str.lhdSixth); width: parent.width / 2;
                }
            }
        }

        Connections{
            target: mLauncher
            onModelReady:{
                JS.createTable(model, mLauncherHardDisk, mTable, JS.createSixModel);
            }
        }

        Component.onCompleted: {
            mTable = tblHardDisk.createObject(mLauncherHardDisk);
            mLauncher.execHardDisk();
        }
    }
}
