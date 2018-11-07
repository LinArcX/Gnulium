import QtQuick 2.9
import QtQuick.Controls 1.4
import "qrc:/strings/CoreStrings.js" as CStr

TableView {
    property string firstTitle

    style: LinArcxTableViewStyle {
    }

    TableViewColumn {
        role: CStr.firstRole
        title: firstTitle
        width: mParent.width
    }
}
