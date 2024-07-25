import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("文件对话框")

    Button{
        text:qsTr("打开文件")
        height: 48
        width: 120
        anchors.centerIn: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {
                fileDialog.open()
            }
        }
    }
    FileDialog{
        id:fileDialog
        nameFilters: ["图像文件 (*.png *.jpg *.gif *.bmp)", "全部文件 (*.*)"]
        onAccepted: {
            console.info((fileDialog.fileUrl))
        }
    }
}
