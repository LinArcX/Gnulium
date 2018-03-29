import QtQuick 2.9
import QtQuick.Controls 2.3
import Qt.labs.platform 1.0
import QtQuick.Dialogs 1.2
import linarcx.gnulium.deCreator 1.0

import "qrc:/util/qml"
import "qrc:/util/js/ElementCreator.js" as JS
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/deCreator/strings/DeCreatorStrings.js" as Str

Row {
    id: mDeCreatorTab
    spacing: CStr.rowSpacing
    anchors.fill: parent
    property variant mVars: ({

                             })
    property int validRaws: 0
    property int validMatures: 0
    signal validate
    signal editMode
    signal newDEMode

    DeCreator {
        id: mDeCreator
    }

    DeCreatorPillar {
        width: parent.width / 5 * 1
        height: parent.height
    }

    SpacerVertical {
    }

    Rectangle {
        width: (parent.width / 5 * 4) - (2 * CStr.tabViewMargin)
        color: CStr.transparent
        height: parent.height

        ScrollView {
            id: mScrollView
            width: parent.width
            height: parent.height //- 2 * btnSave.height
            clip: true
            ScrollBar.horizontal.policy: ScrollBar.AsNeeded //AlwaysOn
            ScrollBar.vertical.policy: ScrollBar.AsNeeded

            Grid {
                id: gridTop
                columns: 4
                rowSpacing: 10
                columnSpacing: 5
                width: mScrollView.width
                height: parent.height
                anchors.top: parent.top
                anchors.topMargin: 5

                Rectangle {
                    id: mIconChooser
                    width: (parent.width / 4 * 1)
                    height: imgIconChooser.height + btnChooseIconPath.height + 15
                    color: CStr.transparent
                    border.color: "black"
                    property bool lock: false

                    Image {
                        id: imgIconChooser
                        source: CStr.imgDesktopEntry
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: iconToolTiper
                            toolTip: Str.lblIconChooser
                        }
                    }

                    Image {
                        id: imgClearIcon
                        source: CStr.imgSweep
                        sourceSize.width: parent.width / 8
                        sourceSize.height: parent.width / 8
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        visible: false
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                imgIconChooser.source = CStr.imgDesktopEntry
                                iconToolTiper.toolTip = Str.lblIconChooser
                                imgClearIcon.visible = false
                            }
                        }
                    }

                    Button {
                        id: btnChooseIconPath
                        text: "<b><font color=\"#db2413\">*</font></b> Choose Icon"
                        z: -1
                        anchors.margins: 5
                        width: btnChooseIconPath.text.length
                        anchors.left: parent.left
                        anchors.top: imgIconChooser.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: iconDialog.open()
                    }

                    FileDialog {
                        id: iconDialog
                        folder: StandardPaths.writableLocation(
                                    StandardPaths.PicturesLocation)
                        modality: Qt.WindowModal
                        title: "Choose an .run file"
                        selectFolder: false
                        nameFilters: ["Image files (*.png *.jpg *.ico)", "All files (*)"]
                        selectedNameFilter: "Image files (*.png *.jpg *.ico)"
                        sidebarVisible: true
                        onAccepted: {
                            imgIconChooser.source = fileUrl
                            iconToolTiper.toolTip = fileUrl
                            imgClearIcon.visible = true
                        }
                        onRejected: {
                            console.log("Rejected")
                        }
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            if (!mIconChooser.lock) {
                                if (typeof iconDialog.fileUrl != 'undefined'
                                        && iconDialog.fileUrl != "") {
                                    mVars.Icon = iconDialog.fileUrls[0]
                                    mIconChooser.border.color = "green"
                                    validMatures++
                                    mIconChooser.lock = true
                                } else {
                                    mIconChooser.border.color = "red"
                                }
                            }
                        }
                        onEditMode: {
                            mIconChooser.lock = false
                        }
                        onNewDEMode: {
                            mIconChooser.lock = false
                            imgClearIcon.visible = false
                            imgIconChooser.source = CStr.imgDesktopEntry
                            iconToolTiper.toolTip = Str.lblIconChooser
                        }
                    }
                    Component.onCompleted: validRaws++
                }

                Rectangle {
                    id: mExecChooser
                    width: (parent.width / 4 * 1)
                    height: imgExecChooser.height + btnChooseExecPath.height + 15
                    color: CStr.transparent
                    border.color: "black"
                    property bool lock: false

                    Image {
                        id: imgExecChooser
                        source: CStr.imgExec
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: execToolTiper
                            toolTip: Str.lblExecChooser
                        }
                    }

                    Image {
                        id: imgClearExec
                        source: CStr.imgSweep
                        sourceSize.width: parent.width / 8
                        sourceSize.height: parent.width / 8
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        visible: false
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                execToolTiper.toolTip = Str.lblExecChooser
                                imgClearExec.visible = false
                            }
                        }
                    }

                    Button {
                        id: btnChooseExecPath
                        text: "<b><font color=\"#db2413\">*</font></b> Choose Exec"
                        anchors.margins: 5
                        width: btnChooseExecPath.text.length
                        anchors.left: parent.left
                        anchors.top: imgExecChooser.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: execDialog.open()
                        z: -1
                    }

                    FileDialog {
                        id: execDialog
                        folder: StandardPaths.writableLocation(
                                    StandardPaths.DesktopLocation)
                        modality: Qt.WindowModal
                        title: "Choose a file"
                        selectFolder: false
                        sidebarVisible: true
                        nameFilters: ["Run files (*.run *.application/x-executable)", "All files (*)"]
                        selectedNameFilter: "All files (*)"
                        onAccepted: {
                            execToolTiper.toolTip = fileUrl
                            imgClearExec.visible = true
                        }
                        onRejected: {
                            console.log("Rejected")
                        }
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            if (!mExecChooser.lock) {
                                if (typeof execDialog.fileUrls != 'undefined'
                                        && execDialog.fileUrls != "") {
                                    mVars.Exec = execDialog.fileUrls[0]
                                    mExecChooser.border.color = "green"
                                    validMatures++
                                    mExecChooser.lock = true
                                } else {
                                    mExecChooser.border.color = "red"
                                }
                            }
                        }
                        onEditMode: {
                            mExecChooser.lock = false
                        }
                        onNewDEMode: {
                            mExecChooser.lock = false
                            imgClearExec.visible = false
                            execToolTiper.toolTip = Str.lblExecChooser
                        }
                    }
                    Component.onCompleted: validRaws++
                }

                Rectangle {
                    id: mCategoryChooser
                    width: (parent.width / 4 * 1)
                    height: imgCategoryChooser.height + cbCategory.height + 15
                    color: CStr.transparent
                    border.color: "black"

                    Image {
                        id: imgCategoryChooser
                        source: CStr.imgCategory
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: categoryToolTiper
                            toolTip: Str.lblCategory
                        }
                    }

                    ComboBox {
                        id: cbCategory
                        anchors.margins: 5
                        anchors.left: parent.left
                        anchors.top: imgCategoryChooser.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z: -1
                        model: ListModel {
                            id: model
                            ListElement {
                                text: "AudioVideo"
                            }
                            ListElement {
                                text: "Audio"
                            }
                            ListElement {
                                text: "Video"
                            }
                            ListElement {
                                text: "Development"
                            }
                            ListElement {
                                text: "Education"
                            }
                            ListElement {
                                text: "Game"
                            }
                            ListElement {
                                text: "Graphics"
                            }
                            ListElement {
                                text: "Network"
                            }
                            ListElement {
                                text: "Office"
                            }
                            ListElement {
                                text: "Science"
                            }
                            ListElement {
                                text: "Settings"
                            }
                            ListElement {
                                text: "System"
                            }
                            ListElement {
                                text: "Utility"
                            }
                            ListElement {
                                text: "Settings"
                            }
                        }
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            mVars.Categories = cbCategory.currentText
                        }
                        onNewDEMode: {
                            cbCategory.currentIndex = 0
                        }
                    }
                }

                Rectangle {
                    width: (parent.width / 4 * 1)
                    height: imgTypeChooser.height + cbType.height + 15
                    color: CStr.transparent
                    border.color: "black"

                    Image {
                        id: imgTypeChooser
                        source: CStr.imgType
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: cbToolTiper
                            toolTip: Str.lblType
                        }
                    }

                    ComboBox {
                        id: cbType
                        anchors.margins: 5
                        anchors.left: parent.left
                        anchors.top: imgTypeChooser.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z: -1
                        model: ListModel {
                            ListElement {
                                text: "Application"
                            }
                            ListElement {
                                text: "Link"
                            }
                            ListElement {
                                text: "Directory"
                            }
                        }
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            mVars.Type = cbType.currentText
                        }
                        onNewDEMode: {
                            cbType.currentIndex = 0
                        }
                    }
                }

                Rectangle {
                    width: (parent.width / 4 * 1)
                    height: imgIsTerminal.height + cbIsTerminal.height + 15
                    color: CStr.transparent
                    border.color: "black"

                    Image {
                        id: imgIsTerminal
                        source: CStr.imgTerminal
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: isTermianlToolTiper
                            toolTip: Str.lblIsTerminal
                        }
                    }

                    ComboBox {
                        id: cbIsTerminal
                        anchors.margins: 5
                        anchors.left: parent.left
                        anchors.top: imgIsTerminal.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z: -1
                        model: ListModel {
                            ListElement {
                                text: "False"
                            }
                            ListElement {
                                text: "True"
                            }
                        }
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            mVars.Terminal = cbIsTerminal.currentText
                        }
                        onNewDEMode: {
                            cbIsTerminal.currentIndex = 0
                        }
                    }
                }

                Rectangle {
                    id: mName
                    width: (parent.width / 4 * 1)
                    height: imgName.height + txtName.height + 15
                    color: CStr.transparent
                    border.color: "black"
                    property bool lock: false

                    Image {
                        id: imgName
                        source: CStr.imgName
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: nameToolTiper
                            toolTip: Str.lblName
                        }
                    }

                    TextField {
                        id: txtName
                        placeholderText: qsTr("<b><font color=\"#db2413\">*</font></b> Name")
                        width: parent.width - 10
                        wrapMode: TextInput.Wrap
                        anchors.top: imgName.bottom
                        anchors.margins: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        z: -1
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            if (!mName.lock) {
                                if (typeof txtName != 'undefined'
                                        && txtName.text != "") {
                                    mName.border.color = "green"
                                    mVars.Name = txtName.text
                                    validMatures++
                                    mName.lock = true
                                } else {
                                    mName.border.color = "red"
                                }
                            }
                        }
                        onEditMode: {
                            mDeCreator.setOldName(txtName.text);
                            mName.lock = false
                        }
                        onNewDEMode: {
                            mName.lock = false
                            txtName.text = ""
                        }
                    }
                    Component.onCompleted: validRaws++
                }

                Rectangle {
                    id: mKeyWords
                    width: (parent.width / 4 * 1)
                    height: imgComment.height + txtKeyWords.height + 15
                    color: CStr.transparent
                    border.color: "black"

                    Image {
                        id: imgKeyWords
                        source: CStr.imgKeywords
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: keyWordsToolTiper
                            toolTip: Str.lblKeywords
                        }
                    }

                    TextField {
                        id: txtKeyWords
                        placeholderText: qsTr("Keywords")
                        width: parent.width - 10
                        anchors.margins: 5
                        wrapMode: TextInput.Wrap
                        anchors.top: imgKeyWords.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z: -1
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            if (typeof txtKeyWords != 'undefined'
                                    && txtKeyWords.text != "") {
                                mVars.Keywords = txtKeyWords.text
                            }
                        }
                        onNewDEMode: {
                            txtKeyWords.text = ""
                        }
                    }
                }

                Rectangle {
                    id: mComment
                    width: (parent.width / 4 * 1)
                    height: imgComment.height + txtComment.height + 15
                    color: CStr.transparent
                    border.color: "black"

                    Image {
                        id: imgComment
                        source: CStr.imgComment
                        sourceSize.width: parent.width / 4
                        sourceSize.height: parent.width / 4
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        ToolTiper {
                            id: commentToolTiper
                            toolTip: Str.lblComment
                        }
                    }

                    TextField {
                        id: txtComment
                        placeholderText: qsTr("Enter Comment")
                        width: parent.width - 10
                        anchors.margins: 5
                        wrapMode: TextInput.Wrap
                        anchors.top: imgComment.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        z: -1
                    }

                    Connections {
                        target: mDeCreatorTab
                        onValidate: {
                            if (typeof txtComment != 'undefined'
                                    && txtComment.text != "") {
                                mVars.Comment = txtComment.text
                            }
                        }
                        onNewDEMode: {
                            txtComment.text = ""
                        }
                    }

                    //                    ScrollView {
                    //                        id: svComment
                    //                        //clip: true
                    //                        width: parent.width
                    //                        padding: Str.padding
                    //                        anchors.top: imgComment.bottom
                    //                        ScrollBar.vertical.policy: ScrollBar.AsNeeded
                    //                        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                    //                        z: -1

                    //                        TextArea {
                    //                            id: txtComment
                    //                            wrapMode: TextArea.Wrap
                    //                            width: parent.width
                    //                        }
                    //                    }
                }
            }
        }

        Button {
            id: btnSave
            text: CStr.save
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            onClicked: {
                validate()
                console.log("validRows: " + validRaws + ", validMatures: " + validMatures)
                if (validRaws == validMatures) {
                    console.log("Form is Clean!")
                    mDeCreator.crateDE(mVars)
                } else {
                    console.log("Form is dirty.")
                }
            }

            Connections {
                target: mDeCreatorTab
                onEditMode: btnSave.visible = true
                onNewDEMode: btnSave.visible = true
            }
        }

        Component {
            id: mDialogResetSettings
            Dialog {
                visible: true
                title: "Desktop Entry Created Successfully!"
                standardButtons: StandardButton.Ok

                Text {
                    text: qsTr(Str.deCreateMessage)
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                }
            }
        }

        Connections {
            target: mDeCreator
            onUpdateUI: {
                var mDialog = mDialogResetSettings.createObject(mDeCreatorTab)
                mDialog.open()
                btnSave.visible = false
                btnEdit.visible = true
                btnNewDE.visible = true
            }
        }

        Button {
            id: btnEdit
            text: CStr.edit
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            visible: false
            onClicked: {
                validMatures = 0
                editMode()
                mVars = ({})
            }

            Connections {
                target: mDeCreatorTab
                onEditMode: btnEdit.visible = false
                onNewDEMode: btnEdit.visible = false
            }
        }

        Button {
            id: btnNewDE
            text: CStr.newDE
            anchors.right: btnEdit.left
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            visible: false
            onClicked: {
                validMatures = 0
                newDEMode()
                mVars = ({})
            }

            Connections {
                target: mDeCreatorTab
                onEditMode: btnNewDE.visible = false
                onNewDEMode: btnNewDE.visible = false
            }
        }
    }
}
