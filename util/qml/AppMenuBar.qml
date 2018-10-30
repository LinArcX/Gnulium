import QtQuick 2.9
import QtQuick.Controls 2.3
import "qrc:/dialogs"
import "qrc:/util/js/MenuCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr

MenuBar {
    id: menuBar
    Component.onCompleted: {
        JS.createMenuItem(tabView, CStr.dashBoard, CStr.dashBoardLink)
    }

    Menu {
        title: qsTr(CStr.gnulium)
        Action {
            text: CStr.dashBoard
            onTriggered: JS.createMenuItem(tabView, CStr.dashBoard, CStr.dashBoardLink)
            icon {
                color: "transparent"
                source: CStr.imgDashBoard
                width: 15
                height: 15
            }
        }
        Action {
            text: qsTr(CStr.settings)
            onTriggered: JS.createMenuItem(tabView, CStr.settings,
                                           CStr.tabSettingsLink)
            icon {
                source: CStr.imgSettings
                width: 15
                height: 15
            }
        }
        MenuSeparator {
        }
        Action {
            text: qsTr(CStr.quit)
            onTriggered: Qt.quit()
            icon {
                source: CStr.imgPower
                width: 15
                height: 15
            }
        }
    }

    Menu {
        title: qsTr(CStr.Utility)
        Action {
            text: qsTr(CStr.histogram)
            onTriggered: JS.createMenuItem(tabView, CStr.histogram,
                                           CStr.tabHistogramLink)

            icon {
                source: CStr.imgAnalytics
                width: 15
                height: 15
            }
        }

        Action {
            text: qsTr(CStr.DesktopEntryCreator)
            onTriggered: JS.createMenuItem(tabView, CStr.DesktopEntryCreator,
                                           CStr.tabDeCreator)

            icon {
                color: "transparent"
                source: CStr.imgDesktopEntry
                width: 15
                height: 15
            }
        }

        Action {
            text: qsTr(CStr.Processes)
            onTriggered: JS.createMenuItem(tabView, CStr.Processes,
                                           CStr.tabProcesses)

            icon {
                source: CStr.imgRam
                width: 15
                height: 15
            }
        }

        Action {
            text: qsTr(CStr.Services)
            onTriggered: JS.createMenuItem(tabView, CStr.Services,
                                           CStr.tabServices)

            icon {
                source: CStr.imgService
                width: 15
                height: 15
            }
        }

        Action {
            text: qsTr(CStr.Disks)
            onTriggered: JS.createMenuItem(tabView, CStr.Disks, CStr.tabDisks)

            icon {
                source: CStr.imgHardDisk
                width: 15
                height: 15
            }
        }

        Action {
            text: qsTr(CStr.Environments)
            onTriggered: JS.createMenuItem(tabView, CStr.Environments, CStr.tabEnvironments)

            icon {
                source: CStr.imgPalette
                width: 15
                height: 15
            }
        }

        Action {
            text: qsTr(CStr.SystemdAnalyze)
            onTriggered: JS.createMenuItem(tabView, CStr.SystemdAnalyze, CStr.tabSystemdAnalyze)

            icon {
                source: CStr.imgAnalytics
                width: 15
                height: 15
            }
        }

        Action {
            text: qsTr(CStr.OpenPorts)
            onTriggered: JS.createMenuItem(tabView, CStr.OpenPorts, CStr.tabPorts)

            icon {
                source: CStr.imgCircuit
                width: 15
                height: 15
            }
        }

        //        Action {
        //            text: qsTr(CStr.subFixer)
        //            onTriggered: JS.createMenuItem(tabView, CStr.subFixer,
        //                                           CStr.tabSubFixer)

        //            icon {
        //                source: CStr.imgSubFixer
        //                width: 15
        //                height: 15
        //            }
        //        }
    }

    Menu {
        id: menuPkgMgrs
        title: qsTr(CStr.PackageManagers)
        Action {
            text: CStr.pacman
            onTriggered: JS.createMenuItem(tabView, CStr.pacman, CStr.tabPacman)
            icon {
                source: CStr.imgPacman
                width: 15
                height: 15
            }
        }
    }

    Menu {
        title: qsTr(CStr.help)
        AboutGnulium {
            id: mAboutGnulium
        }

        Action {
            text: qsTr(CStr.aboutGnulium)
            onTriggered: mAboutGnulium.open()
            icon {
                source: CStr.imgGnulium
                width: 15
                height: 15
            }
        }
        Action {
            text: qsTr(CStr.aboutQT)
            onTriggered: app.aboutQt()
            icon {
                source: CStr.imgQT
                width: 15
                height: 15
            }
        }
    }

    //    Menu {
    //        title: qsTr(CStr.utitlity)
    //        Action {
    //            text: qsTr(CStr.tvdoon)
    //            onTriggered:JS.createMenuItem(tabView, CStr.tvdoon,
    //                                          CStr.tabProcessorsLink);
    //            icon{
    //                source: CStr.imgTvdoon; width: 15; height: 15
    //            }
    //        }
    //        Menu{
    //            title: qsTr(CStr.hardware)
    //            Action {
    //                text: qsTr(CStr.memory)
    //                shortcut: StandardKey.Copy
    //                //onTriggered: window.activeFocusItem.copy()
    //                onTriggered:JS.createMenuItem(tabView, CStr.memory,
    //                                              CStr.tabMemoryLink);
    //                icon{
    //                    source: CStr.imgRam; width: 15; height: 15
    //                }
    //            }
    //        }
    //    }

    //    delegate: MenuBarItem {
    //        id: menuBarItem

    //        contentItem: Text {
    //            text: menuBarItem.text
    //            font: menuBarItem.font
    //            opacity: enabled ? 1.0 : 0.3
    //            color: menuBarItem.highlighted ? "#ffffff" : "#21be2b"
    //            horizontalAlignment: Text.AlignLeft
    //            verticalAlignment: Text.AlignVCenter
    //            elide: Text.ElideRight
    //            height: 10
    //        }

    //        background: Rectangle {
    //            implicitWidth: 40
    //            implicitHeight: 20
    //            opacity: enabled ? 1 : 0.3
    //            color: menuBarItem.highlighted ? "#21be2b" : "transparent"
    //        }
    //    }

    //    background: Rectangle {
    //        implicitWidth: 40
    //        implicitHeight: 40
    //        color: "#ffffff"

    //        Rectangle {
    //            color: "#21be2b"
    //            width: parent.width
    //            height: 1
    //            anchors.bottom: parent.bottom
    //        }
    //    }
}
