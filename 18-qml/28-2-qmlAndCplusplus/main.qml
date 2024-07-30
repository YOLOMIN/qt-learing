import QtQuick 2.12
import QtQuick.Window 2.12
//import an.qt.Mixing 1.0


Rectangle {
    id:root
    anchors.centerIn: parent
    width: 640
    height: 480
    color: "lightgray"

    MouseArea{
        anchors.fill: parent
        acceptedButtons:Qt.LeftButton | Qt.RightButton;

        onClicked: {
            mixing.start()
            mixing.number = 10
        }
    }

    Connections{
        target: mixing
        onColorChanged: {
            root.color = color
            mixing.stop(color)
        }

        onNumberChanged:{
            console.log("new ball number is", mixing.number) // 10
        }
    }
}

