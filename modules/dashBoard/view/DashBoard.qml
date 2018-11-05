import QtQuick 2.9
import QtQuick.Controls 2.3

import "qrc:/util/qml"
import "qrc:/strings/CoreStrings.js" as CStr

Rectangle {
    id: qDashboardTab
    anchors.fill: parent

    Rectangle {
        color: CStr.transparent
        width: parent.width
        height: parent.height

        Rectangle {
            color: CStr.transparent
            width: parent.width
            height: parent.height / 6 * 5
            anchors.top: parent.top

            DashBoardBootTime {
                id: qDashboardBootTime
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }

            DashBoardTime {
                id: qDashboardTime
                anchors.left: qDashboardBootTime.right
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }

//            DashBoardProcess {
//                anchors.left: qDashboardTime.right
//                anchors.top: parent.top
//                anchors.leftMargin: 5
//                anchors.topMargin: 5
//                width: (parent.width / 3) * 1
//                height: parent.height / 2
//            }

            //            DashBoardDownloadUpload {
            //                width: (parent.width / 3) * 1
            //                height: (parent.height / 2)
            //            }
        }

        Rectangle {
            color: CStr.transparent
            width: parent.width
            height: parent.height / 6 * 1
            //            anchors.top: mGrid.bottom
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
