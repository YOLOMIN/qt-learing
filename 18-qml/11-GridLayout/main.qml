import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Grid Layout")

    GridLayout{
        anchors.centerIn: parent
        columns: 2
        rows: 3
        columnSpacing: 20
        rowSpacing: 20
        Layout.rowSpan: 20

        Label{
            text: "用户名"
            font.pixelSize: 20
        }
        Rectangle{
            id:rect1
            border.color: "black"
            width: 200
            height: 30

            TextEdit{
                anchors.fill: rect1
                font.pixelSize: 20
            }
        }

        Label{
            text:"密码"
            font.pixelSize: 20
        }
        Rectangle{
            id:rect2
            border.color: "black"
            width: 200
            height: 30

            TextEdit{
                anchors.fill: rect2
                font.pixelSize: 20
            }
        }

        Button{
            text:"登录"
            font.pixelSize: 20
            Layout.leftMargin: -30
            Layout.topMargin: 50
        }

        Button{
            text:"退出"
            font.pixelSize: 20
            Layout.leftMargin: 140
            Layout.topMargin: 50
        }
    }

}
