import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("字体选择对话框")
    Column{
        anchors.centerIn: parent
        spacing: 100
        Text{
            id:text
            font: fontDialog.font
            text:"Hello world"
        }
        Button{
            text:qsTr("选择字体")
            height:48
            width: 120
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fontDialog.open();
                }
            }
        }
    }
    FontDialog{
        id:fontDialog
        font.pixelSize: 25
        onAccepted: {
            console.info(qsTr("选择的字体名称是：")+ fontDialog.currentFont.family)
            console.info(qsTr("选择的字体大小是：")+ fontDialog.currentFont.pointSize)
        }
    }
}
