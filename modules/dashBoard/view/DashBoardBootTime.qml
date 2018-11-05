import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.DashBoard 1.0
import linarcx.gnulium.sortFilterProxyModel 0.1
import QtQuick.Controls.Material 2.1

import "qrc:/util/qml/"
import "qrc:/util/js/ElementCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/dashBoard/strings/DashBoardStrings.js" as Str

Rectangle {
    id: qBootTime
    radius: 8
    width: (parent.width / 3) * 1
    border.width: 1
    border.color: "lightsteelblue"

    property int procNumber: 0
    property bool qSortOrder: false
    signal processComing

    DashBoard {
        id: qDashBoard
    }

    ListModel {
        id: qModel
    }

    SortFilterProxyModel {
        id: proxyModel
        filterString: "*" + sbBootTime.text + "*"
        sortOrder: Qt.DescendingOrder
        sortCaseSensitivity: Qt.CaseInsensitive
        filterSyntax: SortFilterProxyModel.Wildcard
        filterCaseSensitivity: Qt.CaseInsensitive
        //        sortRole: Qt.DisplayRole
    }

    LinArcxTextField {
        id: sbBootTime
        width: parent.width
        height: 30
        anchors.top: parent.top
        anchors.left: parent.left
        placeholderText: qsTr(Str.bootTiemTitle)
    }

    Rectangle {
        id: qHeader
        width: parent.width
        height: 30
        color: "#673AB7" //"#009688"
        anchors.top: sbBootTime.bottom

        Rectangle {
            id: rectHeaderRow
            color: "transparent"
            width: parent.width
            height: rectHeaderTitle.height
            anchors.verticalCenter: parent.verticalCenter

            Rectangle {
                id: rectHeaderTitle
                anchors.left: parent.left
                color: "transparent"
                width: parent.width / 2
                height: qHeaderTitle.height * 2

                Image {
                    id: mLogo
                    source: CStr.imgAlarmClock
                    sourceSize.width: rectHeaderTitle.height
                    sourceSize.height: rectHeaderTitle.height
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.topMargin: 10
                    anchors.leftMargin: 5
                    antialiasing: true
                    property string toolTip

                    ToolTiper {
                        toolTip: CStr.referesh
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log(Str.bootTiemTitle)
                        }
                    }
                }
                Text {
                    id: qHeaderTitle
                    text: "Title"
                    anchors.centerIn: parent
                    color: "white"
                }
            }
            Rectangle {
                id: rectHeaderTime
                anchors.left: rectHeaderTitle.right
                color: "transparent"
                width: parent.width / 2
                height: qHeaderTime.height * 2
                Text {
                    id: qHeaderTime
                    text: "Time"
                    anchors.centerIn: parent
                    color: "white"
                }
                Image {
                    id: qImgSort
                    source: CStr.imgSortAsc
                    anchors.left: qHeaderTime.right
                    anchors.leftMargin: 5
                    sourceSize.width: qHeaderTime.height
                    sourceSize.height: qHeaderTime.height
                    anchors.verticalCenter: parent.verticalCenter
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (qSortOrder == false) {
                                qImgSort.source = CStr.imgSortDesc
                                proxyModel.setSortOrder(true)
                                qSortOrder = true
                            } else {
                                qImgSort.source = CStr.imgSortAsc
                                proxyModel.setSortOrder(false)
                                qSortOrder = false
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: qDelegate
        Rectangle {
            height: rectRow.height
            anchors.left: parent.left
            anchors.right: parent.right
            color: "transparent"

            Rectangle {
                id: rectRow
                color: "transparent"
                width: parent.width
                height: rectTitle.height

                Rectangle {
                    id: rectTitle
                    color: "transparent"
                    width: parent.width / 2
                    height: qTitle.height * 3 / 2
                    anchors.left: parent.left
                    Text {
                        id: qTitle
                        text: title
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    id: rectTime
                    color: "transparent"
                    width: parent.width / 2
                    height: qTime.height * 3 / 2
                    anchors.left: rectTitle.right
                    Text {
                        id: qTime
                        text: time
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }

    ListView {
        id: lvBootTime
        width: parent.width
        height: parent.height - 3 * sbBootTime.height / 2
        anchors.top: qHeader.bottom
        model: proxyModel
        delegate: qDelegate
    }

    Connections {
        target: qDashBoard
        onKernelTimeReady: {
            processComing()
            qModel.append({
                              "title": kernelTime.split("=")[0],
                              "time": kernelTime.split("=")[1]
                          })
        }
        onUserSpaceTimeReady: {
            processComing()
            qModel.append({
                              "title": userSpaceTime.split("=")[0],
                              "time": userSpaceTime.split("=")[1]
                          })
        }
        onTotalTimeReady: {
            processComing()
            qModel.append({
                              "title": totalTime.split("=")[0],
                              "time": totalTime.split("=")[1]
                          })
        }
    }

    Connections {
        target: qBootTime
        onProcessComing: {
            procNumber++
            if (procNumber == 2) {
                console.log("all processes loaded!")
                proxyModel.source = qModel
                qBootTime.height = 3 * lvBootTime.children[0].height
                        + sbBootTime.height + qHeader.height
                console.log(lvBootTime.children[0].height)
            }
        }
    }

    Component.onCompleted: {
        qDashBoard.getKernelTime()
        qDashBoard.getUserSpaceTime()
        qDashBoard.getTotlaTime()
    }
}
