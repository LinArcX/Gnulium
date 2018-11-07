import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.pacman 1.0
import linarcx.gnulium.sortFilterProxyModel 0.1

import "qrc:/components/qml/"
import "qrc:/components/js/ElementCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/PacmanStrings.js" as Str

Item {
    id: mParent
    property int init: 0

    Pacman{
        id: mPacman
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    Popup {
        id: mPopUp
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        width: appWidth / 2
        height: appHeight / 2
        parent: mPacmanTab

        x: mPacmanTab.width / 2 - mPopUp.width / 2
        y: mPacmanTab.height / 2 - mPopUp.height / 2

        enter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 200 }
            NumberAnimation { property: "y"; from: y; to: y + 10; duration: 200 }
        }

        Image {
            id: imgClose
            x: -20
            y: -20
            source: CStr.imgClose
            sourceSize.width: 20
            sourceSize.height: 20
            z: 1

            states: [
                State {
                    name: "scale"
                    PropertyChanges { target: imgClose; scale: 1.3; }
                },
                State {
                    name: "normal"
                    PropertyChanges { target: imgClose; scale: 1; }
                }
            ]

            transitions: Transition {
                ScaleAnimator { duration: 100; }
            }

            MouseArea{
                hoverEnabled: true
                anchors.fill: parent
                onClicked: mPopUp.close();
                onEntered: imgClose.state = "scale";
                onExited: imgClose.state = "normal";
            }
        }

        Rectangle{
            anchors.fill: parent

            Image {
                id: imgPopUp
                source: CStr.imgRepository
                sourceSize.width: 40
                sourceSize.height: 40
                anchors.margins: 20
                anchors.top: parent.top
                anchors.left: parent.left
                antialiasing: true
            }

            Text {
                text: qsTr(Str.repositories)
                anchors.margins: 20
                anchors.right: parent.right
                anchors.top: parent.top
                font.family: mFont.name
                font.pixelSize: 30
            }

            Rectangle{
                id: spacer
                width: parent.width - 20
                height: 3
                color: "#999"
                anchors.top: imgPopUp.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: qsTr(Str.pacmanRepoPopUp)
                font.pixelSize: 14
                width: mPopUp.width - 60
                wrapMode: TextArea.Wrap
                anchors.top: spacer.bottom
                anchors.left: parent.left
                anchors.margins: 10
            }
        }
    }

    ////// Content
    Rectangle{
        width: parent.width
        height: 30
        color: CStr.transparent

        Image{
            id: mLogo
            property string toolTip
            source: CStr.imgRepository
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
                    init = 0;
                    JS.toogleGif(mGiffy, true, mTable, 0.5);
                    mPacman.execPackages();
                    console.log(Str.repositories);
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
            placeholderText: qsTr(Str.repositories)
        }

        TableTwoColumn{
            id: mTable
            width: mParent.width
            height: mParent.height - (mLogo.height + 10)
            sortIndicatorVisible: true
            anchors.left: parent.left
            anchors.top: mLogo.bottom
            anchors.topMargin: 5
            z: CStr.mOne

            firstTitle: qsTr(Str.prFirst)
            secondTitle: qsTr(Str.prSecond)

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
                                mTable.model.remove(0, mTable.model.count);
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

        //        SortFilterProxyModel{
        //            id: proxyModel
        //            sortOrder: mTable.sortIndicatorOrder
        //            sortCaseSensitivity: Qt.CaseInsensitive
        //            filterString: "*" + searchBox.text + "*"
        //            filterSyntax: SortFilterProxyModel.Wildcard
        //            filterCaseSensitivity: Qt.CaseInsensitive
        //        }

        Connections{
            target: mPacman
            onModelReady:{
                var sourceModel = JS.createThreeModel(model, mParent);
                if(init == 0){
                    JS.toogleGif(mGiffy, false, mTable, 1);
                    JS.createTable(model, mParent, mTable, JS.createTwoModel);
                    //  mTable.model = JS.createProxyModel(sourceModel, proxyModel, mTable);
                    JS.toogleGif(mGiffy, true, mTable, 0.5);
                    init++;
                }else{
                    JS.toogleGif(mGiffy, false, mTable, 1);
                    //  mTable.model += JS.createProxyModel(sourceModel, proxyModel, mTable);
                    JS.appendTwoModel(mTable, model);
                }
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

        Component.onCompleted: {
            JS.toogleGif(mGiffy, true, mTable, 0.5);
            mPacman.execPackages();
        }
    }
}
