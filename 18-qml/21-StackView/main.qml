import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("StackView")
    StackView{
        id:stack
        anchors.fill: parent
        Text{
            text:"Click to create first page"
            font.pointSize: 14
            font.bold: true
            color: "blue"
            anchors.centerIn: parent
            MouseArea{
                anchors.fill: parent
                onClicked: stack.push(mainView)
            }
        }

        pushEnter: Transition {
             PropertyAnimation {
                 target: rect
                 property: "color"
                 to: "orange"
                 duration: 1000
             }
        }
        pushExit: Transition {
            PropertyAnimation {
                target: rect
                property: "color"
                to: "orange"
                duration: 1000
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                target: rect
                property: "color"
                from:"orange"
                to: "green"
                duration: 1000
            }
        }
        popExit: Transition {
            PropertyAnimation {
                target: rect
                property: "color"
                from:"orange"
                to: "green"
                duration: 1000
            }
        }
    }

    Component{
        id:mainView
        Rectangle{
            id:rect
            color: "lightyellow"
            anchors.fill: parent
            Text{
                id:text
                anchors.centerIn: parent
                text:stack.depth
                font.pixelSize: 30
            }

            Row{
                spacing: 10
                anchors.top: text.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 80

                Button{
                    text: "Push"
                    onClicked: stack.push(mainView)
                }
                Button{
                    text: "Pop"
                    enabled: stack.depth > 1
                    onClicked: stack.pop()
                }
                Button{
                    text: "Clear"
                    onClicked: stack.clear()
                }
            }
        }
    }
}
