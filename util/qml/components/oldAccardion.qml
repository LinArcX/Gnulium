   //    property alias headerText: btnHeader.text
    //    property alias bodyText: lblBody.text
    //    property alias bodyVisible: lblBody.visible
    //    property string collapseImage
    //    property string expandImage
    //    color: CStr.accordionBackGroundColor

    //    onBodyVisibleChanged: {
    //        if (bodyVisible) {
    //            btnHeader.icon.source = collapseImage
    //        } else {
    //            btnHeader.icon.source = expandImage
    //        }
    //    }

    //    Button {
    //        id: btnHeader
    //        anchors.top: parent.top
    //        text: "default header"
    //        width: parent.width
    //        icon.source: collapseImage
    //        onClicked: {
    //            if (bodyVisible) {
    //                lblBody.visible = false
    //                btnHeader.icon.source = expandImage
    //            } else {
    //                lblBody.visible = true
    //                btnHeader.icon.source = collapseImage
    //            }
    //        }
    //    }
    //    Label {
    //        id: lblBody
    //        text: "default body"
    //        anchors.top: btnHeader.bottom
    //    }