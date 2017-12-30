import QtQuick 2.9
import QtQuick.Controls 2.2

import "qrc:/util/qml"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/launcher/strings/LauncherStrings.js" as Str

Row{
    anchors.fill: parent
    spacing: CStr.rowSpacing

    LauncherPillar{
        width: parent.width / 5 * 1
        height: parent.height
    }

    SpacerVertical{
    }

    Rectangle{
        width: (parent.width / 5 * 4) - (2 * CStr.tabViewMargin)
        height: parent.height
        color: CStr.transparent
        Grid {
            id: mGrid
            width: parent.width
            height: parent.height / 5 * 4
            anchors.top: parent.top
            columns: 4
            rowSpacing: 10
            columnSpacing: 2

            LauncherMemory {
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }

            LauncherProcess {
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }

            LauncherHardDisk{
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }

            LauncherActiveServices{
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }

            LauncherInfo{
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }

            LauncherOpenPorts{
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }

            LauncherSystemdAnalyze{
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }
            LauncherBootTime{
                width: (parent.width / 4) * 1
                height: (parent.height / 2)
            }
        }
        Rectangle{
            width: parent.width
            height: parent.height / 5 * 1
            anchors.topMargin: 20
            anchors.top: mGrid.bottom
            anchors.bottom: parent.bottom
            color: CStr.transparent
            LauncherArchAge{
                id:lnchArchAge
            }
            LauncherUpTime{
                width: parent.width / 2
                height: parent.height
                anchors.left: lnchArchAge.right
            }
        }
    }
}


