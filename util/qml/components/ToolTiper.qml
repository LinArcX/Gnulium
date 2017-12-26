import QtQuick 2.9
Item {
    anchors.fill: parent
    property string toolTip
    property bool showToolTip: false

    property variant mItem
    property color enterColor
    property color exitColor

    Rectangle {
        id: toolTipRectangle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom
        width: toolTipText.width + 4
        height: toolTipText.height + 4
        z: 400
        opacity: toolTip != "" && showToolTip ? 1 : 0
        color: "#ffffaa"
        border.color: "#0a0a0a"
        Text {
            id: toolTipText
            text: toolTip
            color: "black"
            anchors.centerIn: parent
        }
        Behavior on opacity {
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                duration: 250
            }
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onEntered: {
            showTimer.start();
            if (typeof mItem != 'undefined'){
                mItem.color = enterColor;
            }
        }

        onExited: {
            showToolTip = false;
            showTimer.stop();
            if (typeof mItem != 'undefined'){
                mItem.color = exitColor;
            }
        }

        hoverEnabled: true
    }
    Timer {
        id: showTimer
        interval: 250
        onTriggered: showToolTip = true;
    }
}
