import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("color dialog")
    color: colorDialog.color

    Button{
        text: qsTr("选择颜色")
        height:48
        width: 120
        anchors.centerIn: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {
                colorDialog.open();
            }
        }
    }
    ColorDialog{
        id:colorDialog
        title:qsTr("选择颜色")
        color:"#AAAAAA"
    }
}
