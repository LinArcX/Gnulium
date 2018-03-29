import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1

import "qrc:/dialogs"
import "qrc:/strings/CoreStrings.js" as CStr

TabView {
    id: mTabView
    anchors.fill: parent
    anchors.margins: CStr.tabViewMargin
    anchors.topMargin: mAppMenuBar.height

    //property variant pButtonClose: mButtonClose
    style: TabViewStyle {
        id: mStyle
        tabsMovable: true
        property color frameColor: "#999"
        property color fillColor: "#eee"
        frameOverlap: 1
        frame: Rectangle {
            color: "#F9F9F9" //"#F1F1F1"//"#EFEFEF"//"#E6E6E6"
            border.color: frameColor
        }
        tab: Rectangle {
            id: mRect
            color: styleData.selected ? fillColor : frameColor
            implicitWidth: Math.max(text.width + 24, 80)
            implicitHeight: 20
            Rectangle {
                height: 1
                width: parent.width
                color: frameColor
            }
            Rectangle {
                height: parent.height
                width: 1
                color: frameColor
            }
            Rectangle {
                x: parent.width - 1
                height: parent.height
                width: 1
                color: frameColor
            }
            Text {
                id: text
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 6
                text: styleData.title
                color: styleData.selected ? "black" : "white"
            }

            Image {
                id: mButtonClose
                source: CStr.imgError
                sourceSize.width: parent.height / 3 * 2
                sourceSize.height: parent.height / 3 * 2
                anchors.right: parent.right
                anchors.rightMargin: 4
                anchors.verticalCenter: parent.verticalCenter

                states: [
                    State {
                        name: "normal"
                        PropertyChanges {
                            target: mButtonClose
                            scale: 1
                        }
                    },
                    State {
                        name: "scale"
                        PropertyChanges {
                            target: mButtonClose
                            scale: 1.2
                        }
                    }
                ]

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: mButtonClose.state = "scale" //mButtonClose.color = "#FF5722"
                    onExited: mButtonClose.state = "normal" //mButtonClose.color = "black"
                    onClicked: {
                        //console.log(styleData.totalWidth);
                        if (tabView.count > 1) {
                            tabView.removeTab(styleData.index)
                        } else {
                            //mButtonClose.visible = false;
                            console.log("Please Try again later:)")
                        }
                    }
                }
            }
        }
    }
}
