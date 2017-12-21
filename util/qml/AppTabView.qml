import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1

import "qrc:/dialogs"
import "qrc:/strings/CoreStrings.js" as CStr

TabView {
    //id: mTabView
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
            color: "#eee"
            border.color: frameColor
        }
        tab: Rectangle {
            id: mRect
            color: styleData.selected ? fillColor : frameColor
            implicitWidth: Math.max(text.width + 24, 80)
            implicitHeight: 20
            Rectangle { height: 1 ; width: parent.width ; color: frameColor}
            Rectangle { height: parent.height ; width: 1; color: frameColor}
            Rectangle { x: parent.width -1; height: parent.height ; width: 1; color: frameColor}
            Text {
                id: text
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 6
                text: styleData.title
                color: styleData.selected ? "black" : "white"
            }
            Text {
                id: mButtonClose
                text: "\uf057"
                color: "black"
                font.pointSize: 11
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 4

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: mButtonClose.color = "#FF5722";
                    onExited: mButtonClose.color = "black"
                    onClicked:{
                        console.log(styleData.totalWidth);
                        if(tabView.count>1){
                            tabView.removeTab(styleData.index)
                        }else{
                            //mButtonClose.visible = false;
                            console.log("Please Try again later:)")
                        }

                    }
                }

            }
        }
    }
}
