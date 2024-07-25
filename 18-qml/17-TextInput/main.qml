import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TextInput")
    Row{
        spacing: 10
        anchors.centerIn: parent
        Text{
            text: qsTr("请输入密码:")
            font.pointSize: 15
            verticalAlignment: Text.AlignVCenter
        }
        //不设置maximumLength，当我们输入过多的内容时，就会显示到Rectangle之外
        Rectangle{
            width: input.contentWidth<100?100:input.contentWidth+10
            height: input.contentHeight + 5
            color: "lightgrey"
            border.color: "grey"
            TextInput{
                id:input
                anchors.fill: parent
                anchors.margins: 2
                font.pointSize: 14
                focus: true
//                maximumLength: 6
                echoMode: TextInput.Password
                onEditingFinished: {
                    console.info(text)
                }
            }
        }
    }
    TextField{
        id:control
        placeholderText: qsTr("Enter description")
        background: Rectangle{
            implicitWidth: 200
            implicitHeight: 40
            color: "yellow"
            border.color: "black"
        }
    }


}
