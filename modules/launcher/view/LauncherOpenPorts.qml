import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.launcher 1.0
import linarcx.gnulium.sortFilterProxyModel 0.1

import "qrc:/util/qml/"
import "qrc:/util/js/ElementCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/launcher/strings/LauncherStrings.js" as Str

Column {
    id: mParent
    property int init: 0

    Launcher{
        id: mLauncher
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    LinArcxPopUp{
        id: mPopUp
        mParent: mLauncherTab
        mWidth: appWidth / 2
        mHeight: appHeight / 2
        mImage: CStr.imgCircuit
        mTitle: qsTr(Str.openPortsTitle)
        mBody: qsTr(Str.openPortsPopUp)
    }

    ////// Content
    Rectangle{
        width: parent.width
        height: 30
        color: CStr.transparent

        Image{
            id: mLogo
            property string toolTip
            source: CStr.imgCircuit
            sourceSize.width: parent.height
            sourceSize.height: parent.height
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            antialiasing: true

            ToolTiper {
                toolTip: CStr.referesh
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    JS.toogleGif(mGiffy, true, mTable, 0.5);
                    mLauncher.execOpenPorts();
                    console.log(Str.openPortsTitle);
                }
            }
        }

        LinArcxTextField {
            id: searchBox
            width: parent.width - (mLogo.width + searchBox.anchors.leftMargin)
            height: parent.height
            anchors.top: parent.top
            anchors.left: mLogo.right
            anchors.margins: 5
            placeholderText: qsTr(Str.locked)
        }

        TableThreeColumn{
            id: mTable
            width: mParent.width
            height: mParent.height - (mLogo.height + 10)
            sortIndicatorVisible: true
            anchors.left: parent.left
            anchors.top: mLogo.bottom
            anchors.topMargin: 5
            z: CStr.mOne

            firstTitle: qsTr(Str.lopFirst)
            secondTitle: qsTr(Str.lopSecond)
            thirdTitle: qsTr(Str.lopThird)

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: contextMenu.popup()
                Menu {
                    id: contextMenu
                    Action{
                        text: "Clear";
                        onTriggered: {
                            if(mTable.model){
                                mTable.model.source = null;

                                mTable.opacity = 0.5;
                                searchBox.enabled = false;
                                imgKey.visible = true;
                                searchBox.placeholderText = Str.locked;
                            }
                        }
                        icon{
                            source: CStr.imgSweep; width: 20; height: 20
                        }
                    }
                    Action{
                        text: "What's This?"
                        onTriggered: mPopUp.open();
                        icon{
                            source: CStr.imgQuestionMark; width: 20; height: 20
                        }
                    }
                }
            }
        }

        SortFilterProxyModel{
            id: proxyModel
            sortOrder: mTable.sortIndicatorOrder
            sortCaseSensitivity: Qt.CaseInsensitive
            filterString: "*" + searchBox.text + "*"
            filterSyntax: SortFilterProxyModel.Wildcard
            filterCaseSensitivity: Qt.CaseInsensitive
        }

        Connections{
            target: mLauncher
            onModelReady:{
                searchBox.placeholderText = Str.openPortsTitle;
                JS.toogleGif(mGiffy, false, mTable, 1);
                var sourceModel = JS.createThreeModel(model, mParent);
                mTable.model = JS.createProxyModel(sourceModel, proxyModel, mTable);
            }
        }

        AnimatedImage{
            id: mGiffy
            z:1
            width: 50
            height: 50
            opacity: 1
            visible: false
            source: CStr.gifLoader
            anchors.centerIn: mTable
        }

        Image {
            id: imgKey
            source: CStr.imgLock
            sourceSize.width: parent.width / 5
            sourceSize.height: parent.width / 5
            anchors.centerIn: mTable

            states: [
                State {
                    name: "IN"
                    PropertyChanges { target: imgKey; scale: 1.3 }
                },
                State {
                    name: "OUT"
                    PropertyChanges { target: imgKey; scale: 1 }
                }
            ]

            transitions: Transition {
                ScaleAnimator { duration: 200; }
            }

            MouseArea{
                hoverEnabled: true
                anchors.fill: parent
                onEntered: imgKey.state = "IN"
                onExited: imgKey.state = "OUT"
                onClicked: {
                    mTable.opacity = 1;
                    searchBox.enabled = true;
                    imgKey.visible = false;
                    mLauncher.execOpenPorts();
                }
            }
        }

        Component.onCompleted: {
            mTable.opacity = 0.5;
            searchBox.enabled = false;
            imgKey.visible = true;
        }
    }
}
