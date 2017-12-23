import QtQuick 2.9
import QtQuick.Controls 2.2

import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Row{
    spacing: CStr.rowSpacing
    anchors.fill: parent

    LauncherPillar{
    }

    Grid {
        columnSpacing: 2
        rowSpacing: 8
        columns: 4
        width: (parent.width / 5 * 4) - (2 * CStr.tabViewMargin)
        height: parent.height

        LauncherMemory {
        }

        LauncherProcess {
        }

        LauncherHardDisk{
        }

        LauncherActiveServices{
        }

        LauncherInfo{
        }

        LauncherOpenPorts{
        }

        LauncherSystemdAnalyze{
        }
    }
}


