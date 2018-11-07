import QtQuick 2.9
import QtQuick.Controls 2.3
import linarcx.gnulium.SystemdAnalyze 1.0
import linarcx.gnulium.sortFilterProxyModel 0.1

import "qrc:/components/qml/"
import "qrc:/components/js/ElementCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/DashBoardStrings.js" as Str

Column {
    id: mParent
    property int init: 0

    SystemdAnalyze {
        id: mSysAnalyze
    }

    FontLoader {
        id: mFont
        source: CStr.fontCaviarDreams
    }

    ////// Popup
    LinArcxPopUp {
        id: mPopUp
        mWidth: appWidth / 2
        mHeight: appHeight / 2
        mImage: CStr.imgRadar
        mTitle: qsTr(Str.systemdAnalyzeTitle)
        mBody: qsTr(Str.systemdAnalyzePopUp)
    }

    ////// Content
    Rectangle {
        width: parent.width
        height: 30
        color: CStr.transparent

        Image {
            id: mLogo
            property string toolTip
            source: CStr.imgRadar
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
                    JS.toogleGif(mGiffy, true, mTable, 0.5)
                    mSysAnalyze.execSystemdAnalyze()
                    console.log(Str.systemdAnalyzeTitle)
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
            placeholderText: qsTr(Str.systemdAnalyzeTitle)
        }

        TableTwoColumn {
            id: mTable
            width: mParent.width
            height: mParent.height - (mLogo.height + 10)
            sortIndicatorVisible: true
            anchors.left: parent.left
            anchors.top: mLogo.bottom
            anchors.topMargin: 5
            z: CStr.mOne

            firstTitle: qsTr(Str.lsdaFirst)
            secondTitle: qsTr(Str.lsdaSecond)

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: contextMenu.popup()
                Menu {
                    id: contextMenu
                    Action {
                        text: "Clear"
                        onTriggered: {
                            if (mTable.model) {
                                mTable.model.source = null
                            }
                        }
                        icon {
                            source: CStr.imgSweep
                            width: 20
                            height: 20
                        }
                    }
                    Action {
                        text: "What's This?"
                        onTriggered: mPopUp.open()
                        icon {
                            source: CStr.imgQuestionMark
                            width: 20
                            height: 20
                        }
                    }
                }
            }
        }

        SortFilterProxyModel {
            id: proxyModel
            sortOrder: mTable.sortIndicatorOrder
            sortCaseSensitivity: Qt.CaseInsensitive
            filterString: "*" + searchBox.text + "*"
            filterSyntax: SortFilterProxyModel.Wildcard
            filterCaseSensitivity: Qt.CaseInsensitive
        }

        Connections {
            target: mSysAnalyze
            onModelReady: {
                JS.toogleGif(mGiffy, false, mTable, 1)
                var sourceModel = JS.createTwoModel(model, mParent)
                mTable.model = JS.createProxyModel(sourceModel,
                                                   proxyModel, mTable)
            }
        }

        AnimatedImage {
            id: mGiffy
            z: 1
            width: 50
            height: 50
            opacity: 1
            visible: false
            source: CStr.gifLoader
            anchors.centerIn: mTable
        }

        Component.onCompleted: {
            JS.toogleGif(mGiffy, true, mTable, 0.5)
            mSysAnalyze.execSystemdAnalyze()
        }
    }
}
