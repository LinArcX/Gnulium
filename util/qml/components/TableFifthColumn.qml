import QtQuick 2.9
import QtQuick.Controls 1.4
import "qrc:/strings/CoreStrings.js" as CStr

TableView{
    property string firstTitle
    property string secondTitle
    property string thirdTitle
    property string forthTitle
    property string fifthTitle

    style: LinArcxTableViewStyle{}

    TableViewColumn{
        role: CStr.firstRole; title: firstTitle; width: mParent.width / 5;
    }
    TableViewColumn{
        role: CStr.secondRole; title: secondTitle; width: mParent.width / 5;
    }
    TableViewColumn{
        role: CStr.thirdRole; title: thirdTitle; width: mParent.width / 5;
    }
    TableViewColumn{
        role: CStr.forthRole; title: forthTitle; width: mParent.width / 5;
    }
    TableViewColumn{
        role: CStr.fifthRole; title: fifthTitle; width: mParent.width / 5;
    }
}
