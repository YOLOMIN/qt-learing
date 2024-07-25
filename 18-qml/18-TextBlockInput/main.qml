import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("块编辑输入控件")

    ColumnLayout{

        anchors.centerIn: parent
        spacing: 50
        Rectangle{
            width: 300
            height: 300
            TextEdit{
                id:textedit
                height: parent.height
                width: parent.width
                padding: 2
                textFormat: Text.RichText
                font.family: "Helvetica"
                font.pointSize: 40
                color: "blue"
                focus: true
                wrapMode: TextEdit.WrapAnywhere
            }
        }
        ScrollView{
            id:scView
            width: 200
            height: 100
            background: Rectangle{

                border.color: "gray"
                radius: 5
            }
            TextArea{
                id:contenTextt
                wrapMode: TextArea.WrapAnywhere
                font.pixelSize: 25
            }
        }

        RowLayout{
            spacing: 95
            Button{
                text:"clear"
                rightPadding: 20
                onClicked: {
                    textedit.clear()
                }
            }
            Button{
                text: "append"
                onClicked: {
                    textedit.append("Hell World!")
                }
            }
        }
    }
}
