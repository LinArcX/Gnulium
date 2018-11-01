import QtQuick 2.10
import QtQuick.Controls 2.3

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr

Rectangle {
    color: CStr.accordionBackGroundColor
    width: CStr.accordionWidth
    height: parent.height

    ScrollView {
        id: mScrollView
        clip: true
        width: CStr.accordionWidth
        height: parent.height - 50
        anchors.top: parent.top
        anchors.left: parent.left
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        Column {
            LinArcxAccordionTemplate {
                qTitle: CStr.gnulium
                qImage: CStr.imgGnulium

                Column {
                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.dashBoard
                            mImage: CStr.imgDashBoard
                        }
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.settings
                            mImage: CStr.imgSettings
                        }
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.quit
                            mImage: CStr.imgError
                        }
                    }
                }
            }

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
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.Services
                            mImage: CStr.imgService
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
                qImage: CStr.imgCategory

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

            LinArcxAccordionTemplate {
                qTitle: CStr.help
                qImage: CStr.imgQuestionMark

                Column {
                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.aboutGnulium
                            mImage: CStr.imgGnulium
                        }
                    }

                    Item {
                        width: mScrollView.width
                        height: 50

                        LinArcxAccordionItem {
                            mTitle: CStr.aboutQT
                            mImage: CStr.imgQT
                        }
                    }
                }
            }
        }
    }
}
