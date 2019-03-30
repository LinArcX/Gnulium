import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.DashBoard 1.0

import "qrc:/dialogs"
import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/DashBoardStrings.js" as Str

Rectangle {
    id: qDashboardTab
    anchors.fill: parent

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    DashBoard {
        id: qDashBoard
    }

    AboutGnulium {
        id: qAboutGnulium
    }

    ////// Popup
    LinArcxDialog {
        id: mPopUp
        mImage: CStr.imgGnuLinux
        mTitle: qsTr("Gnulium")
        mBody: qsTr(Str.gnuLinux)
    }

    Rectangle {
        color: CStr.transparent
        width: parent.width
        height: parent.height

        Rectangle {
            id: qDashBoardHeader
            width: parent.width
            height: 30
            anchors.top: parent.top
            color: CStr.accordionItemBackGroundColor

            Image {
                id: qDashBoardHeaderImage
                anchors.left: parent.left
                source: CStr.imgDashBoard
                sourceSize.width: parent.height - 2
                sourceSize.height: parent.height - 2
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: txtHeaderDashBoard
                text: CStr.dashBoard
                anchors.left: qDashBoardHeaderImage.right
                anchors.leftMargin: 2
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
                font.family: mFont.name
                font.bold: true
                color: "white"
            }
            Rectangle {
                id: qRectTorStatus
                width: imgTor.width + txtTor.width
                height: parent.height
                anchors.left: txtHeaderDashBoard.right
                anchors.leftMargin: 5
                color: "transparent"

                AnimatedImage {
                    id: gifTor
                    z: 1
                    opacity: 1
                    visible: false
                    width: parent.height
                    height: parent.height
                    source: CStr.gifEllipsis
                    anchors.centerIn: parent
                }

                Image {
                    id: imgTor
                    source: CStr.imgOnion
                    sourceSize.width: parent.height - 5
                    sourceSize.height: parent.height - 5
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                }

                Text {
                    id: txtTor
                    anchors.left: imgTor.right
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"
                }
            }

            Rectangle {
                id: qRectVGAStatus
                width: imgVGA.width + txtVGA.width
                height: parent.height
                anchors.left: qRectTorStatus.right
                anchors.leftMargin: 5
                color: "transparent"

                AnimatedImage {
                    id: gifVGA
                    z: 1
                    opacity: 1
                    visible: false
                    width: parent.height
                    height: parent.height
                    source: CStr.gifEllipsis
                    anchors.centerIn: parent
                }

                Image {
                    id: imgVGA
                    source: CStr.imgNvidia
                    sourceSize.width: parent.height - 5
                    sourceSize.height: parent.height - 5
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                }

                Text {
                    id: txtVGA
                    anchors.left: imgVGA.right
                    anchors.leftMargin: 5
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"
                }
            }

            Rectangle {
                id: qRectSystemAge
                width: imgSystemAge.width + txtSystemAge.width
                height: parent.height
                anchors.left: qRectVGAStatus.right
                anchors.leftMargin: 5
                color: "transparent"

                AnimatedImage {
                    id: gifSystemAge
                    z: 1
                    opacity: 1
                    visible: false
                    width: parent.height
                    height: parent.height
                    source: CStr.gifEllipsis
                    anchors.centerIn: parent
                }

                Image {
                    id: imgSystemAge
                    source: CStr.imgMan
                    sourceSize.width: parent.height - 5
                    sourceSize.height: parent.height - 5
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                }

                Text {
                    id: txtSystemAge
                    anchors.left: imgSystemAge.right
                    anchors.leftMargin: 5
                    font.pixelSize: 12
                    anchors.bottom: parent.bottom
                    anchors.verticalCenter: imgSystemAge.verticalCenter
                    color: "white"
                }
            }

            Rectangle {
                id: qRectUpTime
                width: imgUpTime.width + txtUpTime.width
                height: parent.height
                anchors.left: qRectSystemAge.right
                anchors.leftMargin: 5
                color: "transparent"

                AnimatedImage {
                    id: gifUpTime
                    z: 1
                    opacity: 1
                    visible: false
                    width: parent.height
                    height: parent.height
                    source: CStr.gifEllipsis
                    anchors.centerIn: parent
                }

                Image {
                    id: imgUpTime
                    source: CStr.imgHourGlass
                    sourceSize.width: parent.height - 5
                    sourceSize.height: parent.height - 5
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                }

                Text {
                    id: txtUpTime
                    anchors.left: imgUpTime.right
                    anchors.leftMargin: 5
                    font.pixelSize: 12
                    //                    font.family: mFont.name
                    anchors.verticalCenter: imgUpTime.verticalCenter
                    color: "white"
                }
            }

            Rectangle {
                id: qRectDashBoardInfo
                width: qImgDashBoardHelp.width
                height: parent.height
                anchors.right: parent.right
                anchors.rightMargin: 5
                color: "transparent"

                Image {
                    id: qImgDashBoardHelp
                    source: CStr.imgAsk
                    anchors.right: parent.right
                    sourceSize.width: parent.height - 10
                    sourceSize.height: parent.height - 10
                    anchors.verticalCenter: parent.verticalCenter
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
                id: qRectAboutQt
                width: qImgQtText.width + qImgQt.width + 10
                height: parent.height
                color: "transparent"
                anchors.right: qRectDashBoardInfo.left
                anchors.rightMargin: 5

                Image {
                    id: qImgQt
                    source: CStr.imgQT
                    sourceSize.width: parent.height
                    sourceSize.height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 5

                    states: [
                        State {
                            name: "scale"
                            PropertyChanges {
                                target: qImgQt
                                scale: 1.3
                            }
                        },
                        State {
                            name: "normal"
                            PropertyChanges {
                                target: qImgQt
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
                        onClicked: app.aboutQt()
                        onEntered: qImgQt.state = "scale"
                        onExited: qImgQt.state = "normal"
                    }
                }
                Text {
                    id: qImgQtText
                    anchors.right: qImgQt.left
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    text: CStr.aboutQT
                    color: "white"
                }
            }

            Rectangle {
                width: qImgGnulium.width + qImgGnuliumText.width
                height: parent.height
                anchors.right: qRectAboutQt.left
                anchors.rightMargin: 5
                color: "transparent"

                Image {
                    id: qImgGnulium
                    source: CStr.imgGnulium
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    sourceSize.width: parent.height - 5
                    sourceSize.height: parent.height - 5
                    antialiasing: true
                    anchors.verticalCenter: parent.verticalCenter

                    states: [
                        State {
                            name: "scale"
                            PropertyChanges {
                                target: qImgGnulium
                                scale: 1.3
                            }
                        },
                        State {
                            name: "normal"
                            PropertyChanges {
                                target: qImgGnulium
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
                        onClicked: qAboutGnulium.open()
                        onEntered: qImgGnulium.state = "scale"
                        onExited: qImgGnulium.state = "normal"
                    }
                }

                Text {
                    id: qImgGnuliumText
                    anchors.right: qImgGnulium.left
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    text: CStr.aboutGnulium
                    color: "white"
                }
            }
        }

        Rectangle {
            color: CStr.transparent
            width: parent.width
            height: parent.height / 6 * 4
            anchors.top: qDashBoardHeader.bottom

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

            DashBoardDownloadUpload {
                anchors.left: qDashboardTime.right
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 5
            }
        }

        Rectangle {
            color: CStr.transparent
            width: parent.width
            height: parent.height / 6 * 1
            anchors.bottom: parent.bottom

            //            DashBoardSystemAge {
            //                id: mArchAge
            //                width: parent.width / 4 * 1
            //                height: parent.height
            //                anchors.left: parent.left
            //                anchors.bottom: parent.bottom
            //            }

            //            DashBoardUpTime {
            //                id: mUpTime
            //                width: parent.width / 4 * 1
            //                height: parent.height
            //                anchors.left: mArchAge.right
            //                anchors.bottom: parent.bottom
            //            }

            //            DashBoardVGAs {
            //                id: mVGAs
            //                width: parent.width / 4 * 1
            //                height: parent.height
            //                anchors.left: mUpTime.right
            //                anchors.bottom: parent.bottom
            //            }

            //            DashBoardTorStatus {
            //                id: mTorStatus
            //                width: parent.width / 4 * 1
            //                height: parent.height
            //                anchors.left: mVGAs.right
            //                anchors.bottom: parent.bottom
            //            }
        }
    }

    Connections {
        target: qDashBoard
        onTorStatusReady: {
            gifTor.visible = false
            txtTor.text = torStatus
        }
        onVgasReady: {
            gifVGA.visible = false
            txtVGA.text = vgas
        }
        onUpTimeReady: {
            gifUpTime.visible = false
            txtUpTime.text = upTime
        }
        onArchAgeReady: {
            gifSystemAge.visible = false
            txtSystemAge.text = archAge
        }
    }

    Component {
        id: mTimer
        Timer {
            interval: Str.interval
            running: true
            repeat: true
            onTriggered: {
                qDashBoard.getUpTime()
            }
        }
    }

    Component.onCompleted: {
        gifTor.visible = true
        qDashBoard.getTorStatus()

        gifVGA.visible = true
        qDashBoard.getVGA()

        gifUpTime.visible = true
        mTimer.createObject(qDashboardTab)

        gifSystemAge.visible = true
        qDashBoard.getArchAge()
    }
}
