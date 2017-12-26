import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import linarcx.gnulium.launcher 1.0

import "qrc:/util/qml/"
import "qrc:/util/js/TableCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/launcher/strings/LauncherStrings.js" as Str

Column {
    id: mLauncherSystemdAnalyze
    spacing: 5
    property variant mTable: ({})
    property int mImageSize: Str.imageSize

    Launcher{
        id: mLauncher
    }

    Row{
        Image{
            id: imgSystemdAnalyze
            sourceSize.width: mImageSize
            sourceSize.height: mImageSize
            antialiasing: true

            source: CStr.imgRadar
            property string toolTip

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mLauncher.execSystemdAnalyze();
                    console.log(Str.systemdAnalyzeTitle);
                }
            }
        }

        Rectangle{
            width: mLauncherSystemdAnalyze.width - mImageSize
            height: imgSystemdAnalyze.height
            color: CStr.transparent
            Text {
                text: qsTr(Str.systemdAnalyzeTitle)
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
                    role: CStr.firstValue; title: qsTr(Str.lsdaFirst); width: parent.width / 3;
                }
                TableViewColumn{
                    role:CStr.secondValue; title: qsTr(Str.lsdaSecond);width: parent.width / 3 * 2;
                }
            }
        }

        Connections{
            target: mLauncher
            onModelReady:{
                JS.createTable(model, mLauncherSystemdAnalyze, mTable, JS.createTwoModel);
            }
        }

        Component.onCompleted: {
            mTable = tblMainInfo.createObject(mLauncherSystemdAnalyze);
            mLauncher.execSystemdAnalyze();
        }
    }
}
