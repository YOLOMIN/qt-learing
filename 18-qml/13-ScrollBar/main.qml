import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ScrollBar")

    Rectangle{
        id:frame
        clip: true
        width: 160
        height: 160
        border.color: "black"
        anchors.centerIn: parent

        Text {
            id: content
            text: qsTr("ABC")
            font.pixelSize: 160
            x:-hbar.position * frame.width
            y:-vbar.position * frame.height
        }
        //交互式滚动条
        ScrollBar{
            id:vbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Vertical
            size:frame.height / content.height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

        ScrollBar{
            id:hbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Horizontal
            size:frame.width / content.width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }

    Rectangle{
        id:frame1
        clip: true
        width: 160
        height: 160
        border.color: "black"
        anchors.top: frame.bottom

        Text {
            id: content1
            text: qsTr("ABC")
            font.pixelSize: 169

            MouseArea{
                id:mouseArea
                drag.target: content1
                drag.minimumX: frame1.width - width
                drag.minimumY: frame1.height - height
                drag.maximumX: 0
                drag.maximumY: 0
                anchors.fill: content1
            }
        }
        //非交互式滚动条
        ScrollIndicator{
            id:verticalIndicator
            active: mouseArea.pressed
            orientation: Qt.Vertical
            size:frame.height / content1.height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

        ScrollIndicator{
            id:horizontalIndicator
            active: mouseArea.pressed
            orientation: Qt.Horizontal
            size:frame1.width / content1.width
            position: -content1.x /content1.width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }
}
