import QtQuick 2.9
import QtCharts 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import linarcx.gnulium.DashBoard 1.0

import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/DashBoardStrings.js" as Str

Rectangle {
    id: mParent
    width: (parent.width / 3) * 1 - 10
    height: qHeader.height + qDownlodUploadInfo.height
    border.width: 1
    border.color: "lightsteelblue"
    color: CStr.transparent
    radius: 8

    DashBoard {
        id: qDashBoard
    }

    ////// Popup
    LinArcxDialog {
        id: mPopUp
        mImage: CStr.imgOnion
        mTitle: qsTr(Str.torStatusTitle)
        mBody: qsTr(Str.torStatusPopUp)
    }

    Rectangle {
        id: qHeader
        width: parent.width
        height: 30
        color: "#8D6E63"
        anchors.top: parent.top
        z: 2

        Image {
            id: mLogo
            source: CStr.imgInternetInfo
            sourceSize.width: qHeader.height + 10
            sourceSize.height: qHeader.height + 10
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 5
            antialiasing: true
        }

        Image {
            id: qImgDashBoardHelp
            source: CStr.imgAsk
            sourceSize.width: 15
            sourceSize.height: 15
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 3
            anchors.topMargin: 3

            states: [
                State {
                    name: "scale"
                    PropertyChanges {
                        target: qImgDashBoardHelp
                        scale: 1.3
                    }
                },
                State {
                    name: "normal"
                    PropertyChanges {
                        target: qImgDashBoardHelp
                        scale: 1
                    }
                }
            ]

            transitions: Transition {
                ScaleAnimator {
                    duration: 100
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: mPopUp.open()
                onEntered: qImgDashBoardHelp.state = "scale"
                onExited: qImgDashBoardHelp.state = "normal"
            }
        }
    }

    Rectangle {
        id: qDownlodUploadInfo
        width: parent.width
        height: qDownload.height + qDownloadPercent.height + qDownloadCurrent.height
                + qDownloadTotal.height + qUpload.height + qUploadPercent.height
                + qUploadCurrent.height + qUploadTotal.height
        anchors.top: qHeader.bottom
        color: "transparent"

        Label {
            id: qDownload
            text: "Download"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: qDownloadPercent.left
        }

        ProgressBar {
            id: qDownloadPercent
            width: parent.width - 10
            anchors.top: qDownload.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            from: 0
            to: 100
        }

        Label {
            id: qDownloadCurrent
            anchors.top: qDownloadPercent.bottom
            anchors.right: qDownloadPercent.right
        }

        Label {
            id: qDownloadTotal
            anchors.top: qDownloadPercent.bottom
            anchors.left: qDownloadPercent.left
        }

        Label {
            id: qUpload
            text: "Upload"
            anchors.top: qDownloadTotal.bottom
            anchors.topMargin: 10
            anchors.left: qUploadPercent.left
        }

        ProgressBar {
            id: qUploadPercent
            width: parent.width - 10
            anchors.top: qUpload.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            from: 0
            to: 100
        }

        Label {
            id: qUploadCurrent
            anchors.top: qUploadPercent.bottom
            anchors.right: qUploadPercent.right
        }

        Label {
            id: qUploadTotal
            anchors.top: qUploadPercent.bottom
            anchors.left: qUploadPercent.left
        }
    }

    Component {
        id: mTimer
        Timer {
            interval: Str.interval
            running: true
            repeat: true
            onTriggered: {
                qDashBoard.getDownloadPercent()
                qDashBoard.getUploadPercent()
            }
        }
    }

    Connections {
        target: qDashBoard
        onDownloadInfoReady: {
            //            console.log("download percent: " + downloadInfo[0])
            //            console.log("download total: " + downloadInfo[1])
            //            console.log("download current: " + downloadInfo[2])
            qDownloadPercent.value = downloadInfo[0]
            qDownloadTotal.text = downloadInfo[1]
            qDownloadCurrent.text = downloadInfo[2]
        }
        onUploadInfoReady: {
            //            console.log("upload: " + uploadInfo[0])
            //            console.log("upload percent: " + uploadInfo[1])
            //            console.log("upload total: " + uploadInfo[2])
            qUploadPercent.value = uploadInfo[0]
            qUploadTotal.text = uploadInfo[1]
            qUploadCurrent.text = uploadInfo[2]
        }
    }

    Component.onCompleted: {
        mTimer.createObject(mParent)
    }
}
