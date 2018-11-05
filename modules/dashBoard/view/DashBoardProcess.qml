import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.DashBoard 1.0
import linarcx.gnulium.sortFilterProxyModel 0.1

import "qrc:/util/qml/"
import "qrc:/util/js/ElementCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/dashBoard/strings/DashBoardStrings.js" as Str

Column {
    id: mParent
    property int init: 0

    DashBoard{
        id: mHome
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    LinArcxPopUp{
        id: mPopUp
        mParent: qDashboardTab
        mWidth: appWidth / 2
        mHeight: appHeight / 2
        mImage: CStr.imgChip
        mTitle: qsTr(Str.topProcessTitle)
        mBody: qsTr(Str.topProcessPopUp)
    }

    ////// Content
    Rectangle{
        width: parent.width
        height: 30
        color: CStr.transparent

        Image{
            id: mLogo
            property string toolTip
            source: CStr.imgChip
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
                    mHome.execTopProcess()
                    //console.log(Str.topProcessTitle);
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
            placeholderText: qsTr(Str.topProcessTitle)
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

//            firstTitle: qsTr(Str.lpFirst)
//            secondTitle: qsTr(Str.lpSecond)
//            thirdTitle: qsTr(Str.lpThird)

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
            filterString: "*" + searchBox.text + "*"
            sortOrder: mTable.sortIndicatorOrder
            sortCaseSensitivity: Qt.CaseInsensitive
            filterSyntax: SortFilterProxyModel.Wildcard
            filterCaseSensitivity: Qt.CaseInsensitive
        }

        Component{
            id : mTimer
            Timer {
                interval: Str.interval; running: true; repeat: true
                onTriggered:{
                    mHome.execTopProcess()
                    //console.log(Str.topProcessTitle);
                }
            }
        }

        Connections{
            target: mHome
            onModelReady:{
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

        Component.onCompleted: {
            JS.toogleGif(mGiffy, true, mTable, 0.5);
            mHome.execTopProcess();
            mTimer.createObject(mParent);
        }
    }
}
