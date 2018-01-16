import QtQuick 2.9
import QtQuick.Controls 2.3

import "qrc:/util/qml"
import "qrc:/strings/CoreStrings.js" as CStr

Row{
    id: mPacmanTab
    spacing: CStr.rowSpacing
    anchors.fill: parent

    PacmanPillar{
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
            height: parent.height / 5 * 4
            anchors.top: parent.top
            columns: 3
            columnSpacing: 2

            PacmanRepositories{
                width: (parent.width / 3) * 1
                height: (parent.height / 2)
            }

            PacmanUpdatePKGs{
                width: (parent.width / 3) * 1
                height: (parent.height / 2)
            }

            PacmanSummary{
                width: (parent.width / 3) * 1
                height: (parent.height / 2)
            }

            PacmanQueryFileDB{
                width: (parent.width / 3) * 1
                height: (parent.height / 2)
            }
        }

        Rectangle{
            color: CStr.transparent
            width: parent.width
            height: parent.height / 5 * 1
            anchors.top: mGrid.bottom
            anchors.bottom: parent.bottom
            PacmanUpdateSize{
                id: mNextUpdateSize
                width: parent.width / 3
                height: parent.height
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }
            PacmanLastUpdateTime{
                id: mLastUpdateTime
                width: parent.width / 3
                height: parent.height
                anchors.left: mNextUpdateSize.right
            }
            PacmanMyAurHelper{
                id: myAurHelper
                width: parent.width / 3
                height: parent.height
                anchors.left: mLastUpdateTime.right
            }
        }
    }
}
