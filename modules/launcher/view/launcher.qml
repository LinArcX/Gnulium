import QtQuick 2.9
import QtQuick.Controls 2.3

import "qrc:/util/qml"
import "qrc:/strings/CoreStrings.js" as CStr

Row{
    id: mLauncherTab
    spacing: CStr.rowSpacing
    anchors.fill: parent

    LauncherPillar{
        width: parent.width / 5 * 1
        height: parent.height
    }

    SpacerVertical{
    }

    Rectangle{
        color: CStr.transparent
        height: parent.height
        width: (parent.width / 5 * 4) - (2 * CStr.tabViewMargin)

        Grid {
            id: mGrid
            width: parent.width
            height: parent.height / 6 * 5
            anchors.top: parent.top
            columns: 4
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

            LauncherEnv{
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
            color: CStr.transparent
            width: parent.width
            height: parent.height / 6 * 1
            anchors.top: mGrid.bottom
            anchors.bottom: parent.bottom

            LauncherArchAge{
                id: mArchAge
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }
            LauncherUpTime{
                id: mUpTime
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: mArchAge.right
                anchors.bottom: parent.bottom
            }
            LauncherVGAs{
                id: mVGAs
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: mUpTime.right
                anchors.bottom: parent.bottom
            }
            LauncherTorStatus{
                id: mTorStatus
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: mVGAs.right
                anchors.bottom: parent.bottom
            }
        }
    }
}
