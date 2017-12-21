import QtQuick 2.9
import QtQuick.Controls 2.3
import "qrc:/dialogs"
import "qrc:/util/js/MenuCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CORESTRINGS

MenuBar {
    Menu {
        title: qsTr(CORESTRINGS.gnulium)
        Action{
            text: CORESTRINGS.home
            onTriggered: JS.createMenuItem(tabView, CORESTRINGS.home,
                                           CORESTRINGS.tabHomeLink);
            icon{
                source: CORESTRINGS.imgService; width: 15; height: 15
            }

        }
        Menu{
            title: qsTr(CORESTRINGS.hardware)
            Action {
                text: qsTr(CORESTRINGS.memory)
                shortcut: StandardKey.Copy
                //onTriggered: window.activeFocusItem.copy()
                onTriggered:JS.createMenuItem(tabView, CORESTRINGS.memory,
                                              CORESTRINGS.tabMemoryLink);
                icon{
                    source: CORESTRINGS.imgRam; width: 15; height: 15
                }
            }
        }
        MenuSeparator { }
        Action {
            text: qsTr(CORESTRINGS.quit);
            onTriggered: Qt.quit();
            icon{
                source: CORESTRINGS.imgPower; width: 15; height: 15
            }
        }
    }

    Menu {
        title: qsTr(CORESTRINGS.distribiutions)
        Menu{
            title: qsTr(CORESTRINGS.arch)
            Action{
                text: CORESTRINGS.pacman
                onTriggered: JS.createMenuItem(tabView, CORESTRINGS.pacman,
                                               CORESTRINGS.tabProcessorsLink);
            }
        }
    }

    Menu {
        title: qsTr(CORESTRINGS.utitlity)
        Action {
            text: qsTr(CORESTRINGS.tvdoon)
            onTriggered:JS.createMenuItem(tabView, CORESTRINGS.tvdoon,
                                          CORESTRINGS.tabProcessorsLink);
        }
    }

    Menu {
        title: qsTr(CORESTRINGS.help)
        AboutGnulium{
            id: mAboutGnulium
        }
        Action {
            text: qsTr(CORESTRINGS.aboutGnulium)
            onTriggered: mAboutGnulium.open();
        }
        Action {
            text: qsTr(CORESTRINGS.aboutQT)
            onTriggered: myApplication.aboutQt()
        }
    }
}
