import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:///util/qml/"
import "/util/js/TableCreator.js" as JS
import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Column {
    id: mLauncherOpenPorts
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
            id: imgOpenPorts
            width: mImageSize
            height: mImageSize
            antialiasing: true

            source: CStr.imgCircuit
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mLauncher.execOpenPorts();
                    console.log(Str.openPortsTitle);
                }
            }
        }

        Rectangle{
            width: mLauncherOpenPorts.width - mImageSize
            height: imgOpenPorts.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.openPortsTitle)
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
                    role: CStr.firstValue; title: qsTr(Str.lopFirst); width: parent.width / 3 * 2;
                }
                TableViewColumn{
                    role:CStr.secondValue; title: qsTr(Str.lopSecond);width: parent.width / 3 * 2;
                }
                TableViewColumn{
                    role: CStr.thirdValue; title: qsTr(Str.lopThird); width: parent.width / 3;
                }
            }
        }

        Connections{
            target: mLauncher
            onModelReady:{
                JS.createTable(model, mLauncherOpenPorts, mTable, JS.createThreeModel);
            }
        }

        Component.onCompleted: {
            mTable = tblMainInfo.createObject(mLauncherOpenPorts);
            mLauncher.execOpenPorts();
        }
    }
}
