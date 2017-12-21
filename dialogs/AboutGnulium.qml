import QtQuick 2.9
import QtQuick.Dialogs 1.3
import "strings/DialogsStrings.js" as STRINGS
import "qrc:/strings/CoreStrings.js" as CORESTRINGS
import "qrc:///util/qml/"

Dialog {
    id: dlgAboutQT
    modality: Qt.WindowModal
    title: STRINGS.title
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
                source: CORESTRINGS.imgGnu

                ToolTiper {
                    toolTip: STRINGS.gnuToolTip
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(STRINGS.gnuLink);
                    anchors.fill: parent
                }
            }
            Text {
                text: qsTr(STRINGS.gnu)
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
                source: CORESTRINGS.imgTux

                ToolTiper {
                    toolTip: STRINGS.linuxToolTip
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(STRINGS.linuxLink);
                    anchors.fill: parent
                }
            }
            Text {
                text: qsTr(STRINGS.linux)
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
                source: CORESTRINGS.imgGnulium
                z:-1

                ToolTiper {
                    toolTip: STRINGS.lilyToolTip
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(STRINGS.liliumLink);
                    anchors.fill: parent
                }
            }
            Text {
                text: qsTr(STRINGS.lilium)
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
            anchors.horizontalCenter: parent.horizontalCenter
            FontLoader {
                id: fontAwesome
                source: CORESTRINGS.fontAwesome
            }



            Text {
                id: lnkGithub
                anchors.centerIn: parent
                font.family: fontAwesome.name
                font.pointSize: 15
                text: "\uf09b"

                ToolTiper {
                    toolTip: STRINGS.githubLink
                    mItem: lnkGithub
                    enterColor: "green"
                    exitColor: "black"
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(STRINGS.githubLink);
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
                    toolTip: STRINGS.telegramLink
                    mItem: lnkTelegram
                    enterColor: "blue"
                    exitColor: "black"
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(STRINGS.telegramLink);
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
                    toolTip: STRINGS.websiteLink
                    mItem: lnkSite
                    enterColor: "orange"
                    exitColor: "black"
                }

                MouseArea {
                    onClicked: Qt.openUrlExternally(STRINGS.websiteLink);
                    anchors.fill: parent
                }
            }
        }
    }
}
