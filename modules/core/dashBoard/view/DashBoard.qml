import QtQuick 2.9
import QtQuick.Controls 2.3

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
                anchors.top: parent.top
                anchors.leftMargin: 10
                source: CStr.imgDashBoard
                sourceSize.width: parent.height - 5
                sourceSize.height: parent.height - 5
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: CStr.dashBoard
                anchors.left: qDashBoardHeaderImage.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16
                font.family: mFont.name
                font.bold: true
                color: "white"
            }

            Rectangle {
                id: qRectDashBoardInfo
                width: qImgDashBoardHelp.width
                height: parent.height
                anchors.right: parent.right
                anchors.rightMargin: 10
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
                width: qImgQtText.width + qImgQt.width
                height: parent.height
                color: "transparent"
                anchors.right: qRectDashBoardInfo.left
                anchors.rightMargin: 20

                Image {
                    id: qImgQt
                    source: CStr.imgQT
                    sourceSize.width: parent.height
                    sourceSize.height: parent.height
                    anchors.verticalCenter: parent.verticalCenter

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
                    anchors.left: qImgQt.right
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    text: CStr.aboutQT
                    color: "white"
                }
            }

            Rectangle {
                width: qImgGnulium.width + qImgGnuliumText.width
                height: parent.height
                anchors.right: qRectAboutQt.left
                anchors.rightMargin: 20
                color: "transparent"

                Image {
                    id: qImgGnulium
                    source: CStr.imgGnulium

                    anchors.left: parent.left
                    anchors.leftMargin: 5
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
                    anchors.left: qImgGnulium.right
                    anchors.leftMargin: 5
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
