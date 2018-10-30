import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "qrc:/util/qml/"
import "qrc:/strings/CoreStrings.js" as CStr

TableView {
    model: processesModel

    style: LinArcxTableViewStyle {
    }

    TableViewColumn {
        role: "pid"
        title: "PID"
        width: mParent.width / 6
    }
    TableViewColumn {
        role: "cmd"
        title: "Process"
        width: mParent.width / 6
    }
    TableViewColumn {
        role: "uname"
        title: "uname"
        width: mParent.width / 6
    }
    TableViewColumn {
        role: "pcpu"
        title: "%CPU"
        width: mParent.width / 6
    }
    TableViewColumn {
        role: "pmem"
        title: "%MEM"
        width: mParent.width / 6
    }
    TableViewColumn {
        role: "rss"
        title: "%Res Mem"
        width: mParent.width / 6
    }
}
