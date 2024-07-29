import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("DelayButton")

    DelayButton{
            id:delaybutton
            anchors.centerIn: parent
            delay: 3000
            text: "演示按钮"

            onActivated:  {
                color =  Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                delaybutton.progress = 0.0
            }
        }
}
