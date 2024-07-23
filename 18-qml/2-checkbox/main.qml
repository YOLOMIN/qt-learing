import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("CheckBox")

    CheckBox{
        anchors.centerIn: parent
        id:control
        text: "选我选我选我！！！"
        spacing:3

        indicator: Rectangle{
            id:rectangle1
            implicitWidth: 26
            implicitHeight: 26
            x:control.leftPadding
            y:parent.height / 2 - height / 2
            radius: 3
            border.color: control.down?"orange":"green"

            Rectangle
            {
                id:rectangle2
                width: 14
                height: 14
                x:6
                y:6
                radius: 2
                color: control.down ? "orange":"green"
                visible: control.checked
            }
        }
    }

}
