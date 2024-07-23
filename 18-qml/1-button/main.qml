import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button{
        id:button
        anchors.centerIn: parent
        text:"我是按钮"
        checkable: true

        background: Rectangle{
            implicitHeight: 25
            implicitWidth: 100
            color: button.pressed?"grey":"green"
            border.width: 2
            border.color: "slategray"
        }

        onClicked: {
            console.info("哎呀，我被按到了！！！")
        }
    }

}
