import QtQuick 2.9
import QtQuick.Controls 2.3
import "qrc:/dialogs"
import "qrc:/util/js/MenuCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr

MenuBar {
    id: menuBar

    Menu {
        title: qsTr(CStr.gnulium)
        Action{
            text: CStr.home
            onTriggered: JS.createMenuItem(tabView, CStr.home,
                                           CStr.tabHomeLink);
            icon{
                source: CStr.imgHome; width: 15; height: 15
            }
        }
        Action {
            text: qsTr(CStr.settings)
            onTriggered: JS.createMenuItem(tabView, CStr.settings,
                                           CStr.tabSettingsLink);
            icon{
                source: CStr.imgSettings; width: 15; height: 15
            }
        }
        MenuSeparator { }
        Action {
            text: qsTr(CStr.quit);
            onTriggered: Qt.quit();
            icon{
                source: CStr.imgPower; width: 15; height: 15
            }
        }

    }

    Menu {
        title: qsTr(CStr.scripts)
        Action {
            text: qsTr(CStr.histogram)
            onTriggered:JS.createMenuItem(tabView, CStr.histogram,
                                          CStr.tabHistogramLink);

            icon{

                source: CStr.imgAnalytics; width: 15; height: 15
            }
        }
    }

//    Menu {
//        title: qsTr(CStr.pkgManagers)
//        Action{
//            text: CStr.pacman
//            onTriggered: JS.createMenuItem(tabView, CStr.pacman,
//                                           CStr.tabProcessorsLink);
//            icon{
//                source: CStr.imgPacman; width: 15; height: 15
//            }
//        }
//        //        Menu{
//        //            title: qsTr(CStr.arch)
//        //        }
//    }



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

    Menu {
        title: qsTr(CStr.help)
        AboutGnulium{
            id: mAboutGnulium
        }

        Action {
            text: qsTr(CStr.aboutGnulium)
            onTriggered: mAboutGnulium.open();
            icon{
                source: CStr.imgGnulium; width: 15; height: 15
            }
        }
        Action {
            text: qsTr(CStr.aboutQT)
            onTriggered: app.aboutQt()
            icon{
                source: CStr.imgQT; width: 15; height: 15
            }
        }
    }

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
