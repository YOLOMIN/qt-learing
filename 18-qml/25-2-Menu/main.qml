import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
Window {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("Menu")

    Button {
    id: button
    anchors.centerIn: parent
    text: "Change"
    onClicked: menu.open()

        Menu {
            id: menu
            y: button.height/2
            x: button.width/2
            background: Rectangle {
                     implicitWidth: 200
                     implicitHeight: 100
                     color: "lightyellow"
                 }

            MenuItem {
                text: "Changecolor..."
                onTriggered: {
                    root.color = "orange"
                }
            }
            MenuItem {
                text: "Changesize..."
                onTriggered: {
                    root.width = root.width/2
                    root.height = root.height/2
                }
            }
            MenuItem {
                text: "Change..."
            }

            MenuSeparator{}

                Menu {
                      title: "Find/Replace"
                      Action { text: "Find Next" }
                      Action { text: "Find Previous" }
                      Action { text: "Replace" }

                      MenuSeparator{}

                      Menu{
                          title: "New"
                          Action { text: "New file" }
                      }
                }
        }
    }


}
