import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("anchors")
    Rectangle{
        id:rect
        anchors.fill: parent
    }

    Rectangle{
        id:anchorsRect
        anchors.top: rect.top
        anchors.bottom: rect.verticalCenter
        anchors.left: rect.left
        anchors.right: rect.horizontalCenter


        anchors.margins: 20
        color: "blue"
        radius: 20

        Text{
            id:text
            anchors.centerIn: anchorsRect
            text: qsTr("Welcome to My World!")
            font.pointSize: 30
            color: "orange"
            anchors.verticalCenterOffset: -50
        }

        Button{
            id:button1
            anchors.top: text.bottom
            anchors.topMargin: 70
            text: "进入"
            font.pixelSize: 20
            anchors.horizontalCenter: text.horizontalCenter
            anchors.horizontalCenterOffset: -150

            background: Rectangle{
                color: "orange"
                radius: 15
                border.color: "black"
            }
        }

        Button{
            id:button2
            anchors.top: text.bottom
            anchors.topMargin: 70
            text:"退出"
            font.pixelSize: 20
            anchors.left: button1.right
            anchors.leftMargin: 250

            background: Rectangle{
                color: "orange"
                radius: 15
                border.color: "black"
            }
        }
    }

    Row{
        id:row
        anchors.top: rect.top
        anchors.bottom: rect.verticalCenter
        anchors.left: rect.horizontalCenter
        anchors.right: rect.right
        spacing: 10

        Rectangle{
            id:rowRectBlue
            anchors.centerIn: row
            width: 100
            height: 100
            color: "blue"
        }
        Rectangle{
            id:rowRectOrange
            anchors.left: rowRectBlue.right
            anchors.top:rowRectBlue.top
//            anchors.margins: 10

            width: 100
            height: 100
            color: "orange"
        }
        Rectangle{
            id:rowRectGreen
            anchors.left: rowRectOrange.right
            anchors.top: rowRectOrange.top
//            anchors.margins: 10

            width: 100
            height: 100
            color: "green"
        }
    }

    Grid{
        anchors.top: rect.verticalCenter
        anchors.bottom: rect.bottom
        anchors.left: rect.left
        anchors.right: rect.right

        rows:2
        rowSpacing: 10
        columns: 2
        columnSpacing: 10

        Rectangle{
            width: 100
            height: 100
            color: "blue"
        }
        Rectangle{
            width: 100
            height: 100
            color: "orange"
        }
        Rectangle{
            width: 100
            height: 100
            color: "green"
        }
        Rectangle{
            width: 100
            height: 100
            color: "purple"
        }
    }
}
