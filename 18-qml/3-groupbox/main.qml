import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    GroupBox{
        id:groupbox
        title:"选择"
        width:200
        height: 180
        anchors.centerIn: parent

        RadioButton{
            id:radio1
            text: "我是1号"
            checked:true
            checkable: false
        }

        RadioButton{
            id:radio2
            anchors.top: radio1.bottom
            anchors.topMargin: 4
            text: "我是2号"
            checked: false
        }

        RadioButton{
            id:radio3
            anchors.top: radio2.bottom
            anchors.topMargin: 4
            text: "我是1号"
            checked: false
        }

    }

}
