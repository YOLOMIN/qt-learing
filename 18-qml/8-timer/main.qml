import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Timer")

    Rectangle{
        id:rect
        anchors.fill: parent
        color: "green"

        Rectangle{
            id:rect1
            x:0
            y:0
            width: 50
            height: 480
            color: "orange"
        }
    }

    Timer{
        id:time
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            if(rect1.x + rect1.width < rect.width){
                rect1.x += 50
            }else{
                rect1.x = 0
            }
        }
    }

    Text{
        id:text
        anchors.centerIn: parent
        color: "red"
        text: "10"
        font.pixelSize: 50
        property int num: 10
    }

    Timer{
        id:time1
        interval: 1000
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            text.text = text.num
            text.num--
            if(text.num < 0)
            {
                time1.stop()
                text.text = "计时结束"
            }
        }
    }

    Button{
        id:start
        anchors.top: text.bottom
        anchors.topMargin: 100
        x:170
        text:"start"
        onClicked: {
            time1.start()
        }
    }

    Button{
        id:restart
        anchors.top:text.bottom
        anchors.topMargin: 100
        anchors.left: start.right
        anchors.leftMargin: 10
        text:"restart"
        onClicked: {
            time1.start()
            text.num = 10
        }
    }

    Button{
        id:stop
        anchors.top: text.bottom
        anchors.topMargin: 100
        anchors.left: restart.right
        anchors.leftMargin: 10
        text:"stop"
        onClicked: {
            time1.stop()
        }
    }
}
