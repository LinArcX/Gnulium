import QtQuick 2.9
import QtQuick.Controls 2.2

import "strings/LauncherStrings.js" as Str
import "qrc:/strings/CoreStrings.js" as CStr

Row{
    spacing: CStr.rowSpacing
    anchors.fill: parent

    Column{
        width: parent.width / 5 * 1
        height: parent.height
        Image {
            id: imgGnuLinux
            source: CStr.imgGnuLinux
            width: parent.width
            height: parent.width
        }
        ScrollView {
            Text {
                id: sd
                text: qsTr(Str.gnuLinux)
                width: imgGnuLinux.width
                height: 10
                padding: 10
                wrapMode: Text.WordWrap
            }
        }
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


