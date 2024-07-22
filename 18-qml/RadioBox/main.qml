import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ExclusiveGroup{
        id:exclusivegroup
    }

    Rectangle{
        width: 200
        height: 200
        anchors.centerIn: parent
        RadioButton{
            id:radio1
            text: "我是1号"
            checked: true
            exclusiveGroup:exclusivegroup
        }

        RadioButton{
            id:radio2
            anchors.top: radio1.bottom
            anchors.topMargin: 10
            text: "我是2号"
            checked: false
            exclusiveGroup:exclusivegroup
        }

        RadioButton{
            id:radio3
            anchors.top: radio2.bottom
            anchors.topMargin: 10
            text: "我是3号"
            checked: false
            exclusiveGroup:exclusivegroup
        }

    }

}
