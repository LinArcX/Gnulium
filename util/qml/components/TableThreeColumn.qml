import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "qrc:/components/qml/"
import "qrc:/strings/CoreStrings.js" as CStr

TableView {
    property string firstTitle
    property string secondTitle
    property string thirdTitle

    style: LinArcxTableViewStyle {
    }

    TableViewColumn {
        role: CStr.firstRole
        title: firstTitle
        width: mParent.width / 3
    }
    TableViewColumn {
        role: CStr.secondRole
        title: secondTitle
        width: mParent.width / 3
    }
    TableViewColumn {
        role: CStr.thirdRole
        title: thirdTitle
        width: mParent.width / 3
    }
}
