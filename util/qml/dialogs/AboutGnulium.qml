import QtQuick 2.9
import QtQuick.Dialogs 1.3

import "qrc:/util/qml"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/dialogs/strings/DialogStrings.js" as Str

Dialog {
    id: dlgAboutQT
    modality: Qt.WindowModal
    title: Str.title
    width: 640
    height: 480

    standardButtons: StandardButton.Close
    Column{
        anchors.fill: parent
        Row{
            Image {
                id: imgGnu
                width: 150
                height: 150
                source: CStr.imgGnu

                ToolTiper {
                    toolTip: Str.gnuToolTip
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(Str.gnuLink);
                    anchors.fill: parent
                }
            }
            Text {
                text: qsTr(Str.gnu)
                anchors.verticalCenter: imgGnu.verticalCenter
                anchors.leftMargin: 50
                width: dlgAboutQT.width - (imgGnu.width  + 20)
                wrapMode: Text.WordWrap
            }
        }
        Row{
            Image {
                id: imgLinux
                width: 150
                height: 150
                source: CStr.imgTux

                ToolTiper {
                    toolTip: Str.linuxToolTip
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(Str.linuxLink);
                    anchors.fill: parent
                }
            }
            Text {
                text: qsTr(Str.linux)
                anchors.verticalCenter: imgLinux.verticalCenter
                anchors.leftMargin: 50
                width: dlgAboutQT.width - (imgGnu.width  + 20)
                wrapMode: Text.WordWrap
            }
        }
        Row{
            id: mRowGnulium
            Image {
                id: imgGnulium
                width: 150
                height: 150
                source: CStr.imgGnulium
                z:-1

                ToolTiper {
                    toolTip: Str.lilyToolTip
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(Str.liliumLink);
                    anchors.fill: parent
                }
            }
            Text {
                text: qsTr(Str.lilium)
                anchors.verticalCenter: imgGnulium.verticalCenter
                anchors.leftMargin: 50
                width: dlgAboutQT.width - (imgGnulium.width  + 20)
                wrapMode: Text.WordWrap
            }
        }

        Rectangle{
            id: rectLinks
            anchors.top: mRowGnulium.Bottom
            anchors.bottom: parent.bottom
            FontLoader {
                id: fontAwesome
                source: CStr.fontAwesome
            }

            Text {
                id: gitVersionTitle
                text: qsTr("Last Commit: ")
                anchors.left: parent.left
            }

            Text {
                id: gitVersion
                text: qsTr(dispatcher.appVer)
                anchors.left: gitVersionTitle.right
                anchors.bottom: gitVersionTitle.bottom
            }

            Text {
                id: lnkGithub
                anchors.left: gitVersion.right
                anchors.bottom: gitVersion.bottom
                anchors.leftMargin:
                    dlgAboutQT.width / 2 -
                    (gitVersionTitle.width + gitVersion.width +
                     lnkGithub.width + lnkTelegram.width + lnkSite.width)
                font.family: fontAwesome.name
                font.pointSize: 15
                text: "\uf09b"

                ToolTiper {
                    toolTip: Str.githubLink
                    mItem: lnkGithub
                    enterColor: "green"
                    exitColor: "black"
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(Str.githubLink);
                    anchors.fill: parent
                }
            }

            Text {
                id: lnkTelegram
                anchors.left: lnkGithub.right
                anchors.bottom: lnkGithub.bottom
                anchors.leftMargin: 5
                font.family: fontAwesome.name
                font.pointSize: 13
                text: "\uf2c6"

                ToolTiper {
                    toolTip: Str.telegramLink
                    mItem: lnkTelegram
                    enterColor: "blue"
                    exitColor: "black"
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(Str.telegramLink);
                    anchors.fill: parent
                }
            }

            Text {
                id: lnkSite
                anchors.left: lnkTelegram.right
                anchors.bottom: lnkTelegram.bottom
                anchors.leftMargin: 7
                font.family: fontAwesome.name
                font.pointSize: 13
                text: "\uf269"

                ToolTiper {
                    toolTip: Str.websiteLink
                    mItem: lnkSite
                    enterColor: "orange"
                    exitColor: "black"
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(Str.websiteLink);
                    anchors.fill: parent
                }
            }
        }
    }
}
