import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Column Layout")

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 20

        Text{
            text: "请选择喜欢的科目"
            font.pointSize: 20
            color: "purple"
            font.bold: true
            Layout.leftMargin: 30

        }

        CheckBox{
            text: "语文"
            Layout.leftMargin: 30
            font.pixelSize: 15
        }

        CheckBox{
            text: "数学"
            Layout.leftMargin: 30
            font.pixelSize: 15
        }

        CheckBox{
            text: "英语"
            Layout.leftMargin: 30
            font.pixelSize: 15
        }

        CheckBox{
            text: "生物"
            Layout.leftMargin: 30
            font.pixelSize: 15
        }

        CheckBox{
            text: "化学"
            Layout.leftMargin: 30
            font.pixelSize: 15
        }
    }

}
