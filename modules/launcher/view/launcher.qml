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

    Grid {
        columnSpacing: 2
        rowSpacing: 8
        columns: 4
        width: (parent.width / 5 * 4) - (2 * CStr.tabViewMargin)
        height: parent.height

        LauncherMemory {
            width: (parent.width / 4) * 1
            height: (parent.height / 3)
        }

        LauncherProcess {
            width: (parent.width / 4) * 1
            height: (parent.height / 3)
        }

        LauncherHardDisk{
            width: (parent.width / 4) * 1
            height: (parent.height / 3)
        }

        LauncherActiveServices{
            width: (parent.width / 4) * 1
            height: (parent.height / 3)
        }

        LauncherInfo{
            width: (parent.width / 4) * 1
            height: (parent.height / 3)
        }

        LauncherOpenPorts{
            width: (parent.width / 4) * 1
            height: (parent.height / 3)
        }

        LauncherSystemdAnalyze{
            width: (parent.width / 4) * 1
            height: (parent.height / 3)
        }
    }
}


