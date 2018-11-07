import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.subFixer 1.0

import "qrc:/components/qml"
import "qrc:/strings/CoreStrings.js" as CStr

Row {
    id: mPacmanTab
    spacing: CStr.rowSpacing
    anchors.fill: parent

    SubFixer {
        id: mSubFixer
    }

    SubFixerPillar {
        width: parent.width / 5 * 1
        height: parent.height
    }

    SpacerVertical {
    }

    Rectangle {
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

            Rectangle {
                id: item
                property string display: "Drop Subtitle To Fix..."
                color: dropArea.containsDrag ? "#CFC" : "#EEE"

                width: (parent.width / 3) * 1
                height: (parent.height / 2)

                //display: "Drop Subtitle To Fix..."
                ColorAnimation on color {
                    id: rejectAnimation
                    from: "#FCC"
                    to: "#EEE"
                    duration: 1000
                }

                Text {
                    anchors.fill: parent
                    text: item.display
                    wrapMode: Text.WordWrap
                }

                DropArea {
                    id: dropArea
                    anchors.fill: parent
                    keys: ["text/plain"]
                    onDropped: {
                        if (drop.hasText) {
                            if (drop.proposedAction == Qt.MoveAction
                                    || drop.proposedAction == Qt.CopyAction) {
                                item.display = drop.text
                                drop.acceptProposedAction()
                                mSubFixer.convertEncoding(drop.text.toString())
                            }
                        }
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    drag.target: draggable
                }

                Item {
                    id: draggable
                    anchors.fill: parent
                    Drag.active: mouseArea.drag.active
                    Drag.hotSpot.x: 0
                    Drag.hotSpot.y: 0
                    Drag.mimeData: {
                        "text/plain": item.display
                    }
                    Drag.dragType: Drag.Automatic
                    Drag.onDragFinished: if (dropAction == Qt.MoveAction)
                                             item.display = ""
                }
            }

            //            DragAndDropTextItem {
            //                //Layout.fillWidth: true
            //                width: (parent.width / 3) * 1
            //                height: (parent.height / 2)
            //                display: "Drop Subtitle To Fix..."

            //            }
        }

        Rectangle {
            color: CStr.transparent
            width: parent.width
            height: parent.height / 5 * 1
            anchors.top: mGrid.bottom
            anchors.bottom: parent.bottom
        }
    }
}
