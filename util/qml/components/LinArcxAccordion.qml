import QtQuick 2.10
import QtQuick.Controls 2.3

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/dashBoard/strings/DashBoardStrings.js" as Str

Rectangle {
    id: qParent
    color: CStr.accordionBackGroundColor
    width: CStr.accordionWidth
    height: parent.height

    Item {
        id: qDashBoardd
        width: mScrollView.width
        anchors.top: qParent.top
        height: 50

        LinArcxAccordionItem {
            mTitle: CStr.dashBoard
            mImage: CStr.imgDashBoard
            isHeader: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                pageLoader.source = CStr.dashBoardLink
            }
        }
    }

    ScrollView {
        id: mScrollView
        clip: true
        width: CStr.accordionWidth
        height: parent.height - 100
        anchors.top: qDashBoardd.bottom
        anchors.left: parent.left
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        Column {

            LinArcxAccordionTemplate {
                qTitle: CStr.info
                qImage: CStr.imgInformation

                Column {
                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.Processes
                            mImage: CStr.imgRam
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                pageLoader.source = CStr.processesLink
                            }
                        }
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.Services
                            mImage: CStr.imgService
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                pageLoader.source = CStr.servicesLink
                            }
                        }
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.Disks
                            mImage: CStr.imgHardDisk
                        }
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.Environments
                            mImage: CStr.imgPalette
                        }
                    }
                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.SystemdAnalyze
                            mImage: CStr.imgAnalytics
                        }
                    }
                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.OpenPorts
                            mImage: CStr.imgCircuit
                        }
                    }
                }
            }

            LinArcxAccordionTemplate {
                qTitle: CStr.Utility
                qImage: CStr.imgScripts

                Column {
                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.histogram
                            mImage: CStr.imgAnalytics
                        }
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.DesktopEntryCreator
                            mImage: CStr.imgDesktopEntry
                        }
                    }
                }
            }

            LinArcxAccordionTemplate {
                qTitle: CStr.PackageManagers
                qImage: CStr.imgBox

                Column {
                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.pacman
                            mImage: CStr.imgPacman
                        }
                    }
                }
            }
        }
    }

    Item {
        width: mScrollView.width
        height: 50
        anchors.bottom: qParent.bottom

        LinArcxAccordionItem {
            mTitle: CStr.settings
            mImage: CStr.imgSettings
            isHeader: true
            imageOnly: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                pageLoader.source = CStr.settingsLink
            }
        }
    }
}
