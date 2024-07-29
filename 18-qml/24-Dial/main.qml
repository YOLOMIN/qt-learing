import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Dial{
        id: dial
        anchors.centerIn: parent

        background: Rectangle {
            id:rect
            width: 200
            height: width
            color: Qt.rgba(0,0,0,0)
            radius: width / 2
            border.color: dial.pressed ? "orange" : "green"
        }

         handle: Rectangle {
             id: handleItem
             x: dial.background.x + dial.background.width / 2 - width / 2
             y: dial.background.y + dial.background.height / 2 - height / 2
             width: 16
             height: 16
             color: dial.pressed ? "orange" : "green"
             radius: 8
             transform: [
                 Translate {
                     y: -Math.min(dial.background.width, dial.background.height) * 0.4 + handleItem.height / 2
                 },
                 Rotation {
                     angle: dial.angle
                     origin.x: handleItem.width / 2
                     origin.y: handleItem.height / 2
                 }
             ]
         }
    }

    Switch {
        id: root
//        anchors.centerIn: parent

        indicator: Rectangle {
            width: 80
            height: 40
            radius: height / 2
            color: "blue"
            border.width: 2
            border.color: "blue"

            Rectangle {
                x: root.checked ? parent.width - width - 1: 1
                width: parent.height - 2
                height: width
                radius: width / 2
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
            }
        }
    }
}
