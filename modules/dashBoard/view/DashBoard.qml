import QtQuick 2.9
import QtQuick.Controls 2.3

import "qrc:/util/qml"
import "qrc:/strings/CoreStrings.js" as CStr

Row {
    id: qDashboardTab
    spacing: CStr.rowSpacing
    anchors.fill: parent

//    DashBoardPillar {
//        width: parent.width / 5 * 1
//        height: parent.height
//    }

//    SpacerVertical {
//    }

    Rectangle {
        color: CStr.transparent
        height: parent.height
        width: (parent.width) - (2 * CStr.tabViewMargin)

        Grid {
            id: mGrid
            width: parent.width
            height: parent.height / 6 * 5
            anchors.top: parent.top
            columns: 3
            columnSpacing: 2

            DashBoardBootTime {
                width: (parent.width / 3) * 1
                height: (parent.height / 2)
            }

            DashBoardTime{


            }

            DashBoardDownloadUpload {
                width: (parent.width / 3) * 1
                height: (parent.height / 2)
            }
        }
        Rectangle {
            color: CStr.transparent
            width: parent.width
            height: parent.height / 6 * 1
            anchors.top: mGrid.bottom
            anchors.bottom: parent.bottom

            DashBoardSystemAge {
                id: mArchAge
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }
            DashBoardUpTime {
                id: mUpTime
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: mArchAge.right
                anchors.bottom: parent.bottom
            }
            DashBoardVGAs {
                id: mVGAs
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: mUpTime.right
                anchors.bottom: parent.bottom
            }
            DashBoardTorStatus {
                id: mTorStatus
                width: parent.width / 4 * 1
                height: parent.height
                anchors.left: mVGAs.right
                anchors.bottom: parent.bottom
            }
        }
    }
}
