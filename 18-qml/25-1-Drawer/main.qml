import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Menu")
    color:"lightgray"

    Button{
        anchors.centerIn: parent
        text: "打开左侧菜单"

        onClicked: {
            if(drawer.visible)
            {
                drawer.close()
            }else{
                drawer.open()
            }
        }
     }

    Drawer {
        id: drawer
        width: 0.3 * root.width
        height: root.height
        dragMargin: parent.width/3

        Column{
            Button{
                width: drawer.width
                text: "New file"
            }

            Button{
                width: drawer.width
                text: "save"
            }

            Button{
                width: drawer.width
                text: "save as..."
            }
        }
    }
}
