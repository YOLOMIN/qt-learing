import QtQuick 2.12
import QtQuick.Window 2.12
import an.qt.Mixing 1.0
Window {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("实现可以被QML访问的 C++ 类")

    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton|Qt.RightButton;
        onClicked: {
           if(mouse.button === Qt.LeftButton)
           {
               mixing.start(Mixing.BALL_COLOR_BLUE)
               console.info("blue")
           }
           else if(mouse.button === Qt.RightButton)
           {
                mixing.start(Mixing.BALL_COLOR_GREEN)
               console.info("green")
           }
        }
        onDoubleClicked: {
            mixing.start(Mixing.BALL_COLOR_YELLOW)
            mixing.number = 10
        }
    }
    Mixing{
        id:mixing
        onColorChanged: {
            root.color = color
            mixing.stop(color)
        }
        //完成初始化后执行
        Component.onCompleted:
        {
            console.info("default ball number is", number)
        }

        onNumberChanged:
        {
            console.info("new ball number is", number)
        }
    }
}
