import QtQuick 2.9
import QtQuick.Window 2.2
import an.qt.Mixing 1.0

Window {
    id:root
    visible: true
    width: 640
    height: 480

    signal qmlSignal(string message)
    onQmlSignal: console.log("这是一个信号：",message)

    function qmlFunction(parameter)
    {
        console.log("这是一个方法：",parameter)
        return "function from qml"
    }

    Rectangle {
          objectName: "rect"
          anchors.fill: parent
    }

    MouseArea{
        anchors.fill: parent
        acceptedButtons:Qt.LeftButton | Qt.RightButton;

        onClicked: {
            mixing.start()
            mixing.number = 10
            qmlSignal("这是qml文件中的qml信号")
        }
    }

    Mixing{
        id:mixing
    }
}
