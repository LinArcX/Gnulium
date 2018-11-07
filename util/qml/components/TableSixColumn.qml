import QtQuick 2.9
import QtQuick.Controls 1.4

import "qrc:/strings/CoreStrings.js" as CStr

TableView {
    property string firstTitle
    property string secondTitle
    property string thirdTitle
    property string forthTitle
    property string fifthTitle
    property string sixthTitle

    property int firstW
    property int secondW
    property int thirdW
    property int forthW
    property int fifthW
    property int sixthW

    style: LinArcxTableViewStyle {
    }

    TableViewColumn {
        role: CStr.firstRole
        title: firstTitle
        width: firstW ? firstW : mParent.width / 6
    }
    TableViewColumn {
        role: CStr.secondRole
        title: secondTitle
        width: secondW ? secondW : mParent.width / 6
    }
    TableViewColumn {
        role: CStr.thirdRole
        title: thirdTitle
        width: thirdW ? thirdW : mParent.width / 6
    }
    TableViewColumn {
        role: CStr.forthRole
        title: forthTitle
        width: forthW ? forthW : mParent.width / 6
    }
    TableViewColumn {
        role: CStr.fifthRole
        title: fifthTitle
        width: fifthW ? fifthW : mParent.width / 6
    }
    TableViewColumn {
        role: CStr.sixthRole
        title: sixthTitle
        width: sixthW ? sixthW : mParent.width / 6
    }
}
