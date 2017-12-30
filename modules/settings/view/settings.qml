import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import linarcx.gnulium.settings 1.0

import "qrc:/util/qml"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/settings/strings/SettingsStrings.js" as Str

Row{
    id: mSettingsContent
    spacing: CStr.rowSpacing
    anchors.fill: parent
    property variant mySettings: ({})

    Settings{
        id: mSettings
    }

    SettingsPillar{
        width: parent.width / 5 * 1
        height: parent.height
    }

    SpacerVertical{
    }

    Rectangle{
        width: parent.width / 5 * 4 - (CStr.tabViewMargin)
        height: parent.height
        color: CStr.transparent
        ScrollView {
            id: mScrollView
            width: parent.width
            height: parent.height - 2 * btnSave.height
            clip: true
            ScrollBar.horizontal.policy: ScrollBar.AsNeeded//AlwaysOn
            ScrollBar.vertical.policy: ScrollBar.AsNeeded

            Grid {
                columns: 4
                rowSpacing: 4
                columnSpacing: 4
                width: mScrollView.width
                height: mScrollView.height

                Rectangle{
                    id: mRectStyle
                    width: (parent.width / 4 * 1)
                    height: imgStyle.height + cbStyle.height + 10
                    color: CStr.transparent
                    border.color: "black"
                    Image {
                        id: imgStyle
                        source: CStr.imgPalette
                        sourceSize.width: parent.width / 6
                        sourceSize.height: parent.width / 6
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            toolTip: Str.lblStyles
                        }
                    }
                    ComboBox {
                        id: cbStyle
                        anchors.margins: 5
                        anchors.left: parent.left
                        anchors.top: imgStyle.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z:-1
                        currentIndex: 1
                        model: ListModel {
                            id: styleModel
                            ListElement { text: "Default" }
                            ListElement { text: "Imagine" }
                            ListElement { text: "Fusion" }
                            ListElement { text: "Universal" }
                            ListElement { text: "Material" }
                        }
                    }
                }

                Rectangle{
                    width: (parent.width / 4 * 1)
                    height: imgFontFamily.height + cbFontFamily.height + 10
                    color: CStr.transparent
                    border.color: "black"
                    Image {
                        id: imgFontFamily
                        source: CStr.imgText
                        sourceSize.width: parent.width / 6
                        sourceSize.height: parent.width / 6
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            toolTip: Str.lblFontFamily
                        }
                    }
                    ComboBox {
                        id: cbFontFamily
                        anchors.margins: 5
                        anchors.left: parent.left
                        anchors.top: imgFontFamily.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z:-1
                        currentIndex: 2
                        model: ListModel {
                            id: styleFontFamily
                            ListElement { text: "Vazir"}
                            ListElement { text: "Adele"}
                            ListElement { text: "XmYekan" }
                            ListElement { text: "Shabnam" }
                            ListElement { text: "RadioSpace" }
                            ListElement { text: "CaviarDreams" }
                        }
                    }
                }


                Rectangle{
                    width: (parent.width / 4 * 1)
                    height: imgFontSize.height + cbFontSize.height + 10
                    color: CStr.transparent
                    border.color: "black"
                    Image {
                        id: imgFontSize
                        source: CStr.imgFontSize
                        sourceSize.width: parent.width / 6
                        sourceSize.height: parent.width / 6
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            toolTip: Str.lblFontSize
                        }
                    }
                    ComboBox {
                        id: cbFontSize
                        anchors.margins: 5
                        anchors.left: parent.left
                        anchors.top: imgFontSize.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z:-1
                        currentIndex: 2
                        model: ListModel {
                            id: styleFontSize
                            ListElement { text: "8" }
                            ListElement { text: "10" }
                            ListElement { text: "12" }
                            ListElement { text: "14" }
                            ListElement { text: "16" }
                        }
                    }
                }
            }
        }

        Component{
            id: mDialogChangeSettings
            Dialog {
                id: dateDialog
                visible: true
                title: "Choose a date"
                standardButtons: StandardButton.Yes | StandardButton.No | StandardButton.Cancel

                onYes: mSettings.restartApp();
                onNo: console.log("no");
                onRejected: console.log("reject")

                Text {
                    text: qsTr(Str.settingsDone)
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                }
            }
        }

        Button{
            id: btnSave
            text: CStr.save
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 5
            anchors.topMargin: 5
            anchors.bottomMargin: 5
            onClicked:{
                mySettings.fontFamily = cbFontFamily.currentText;
                mySettings.fontSize = cbFontSize.currentText;
                mySettings.style = cbStyle.currentText;
                mSettings.setSettings(mySettings);

                var mDialog = mDialogChangeSettings.createObject(mSettingsContent);
                mDialog.open();
            }
        }
    }
}
