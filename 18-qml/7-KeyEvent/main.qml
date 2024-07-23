import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Key Event")

    Rectangle{
        anchors.fill: parent
        color: "gray"
        focus: true
        Keys.enabled: true
        Keys.forwardTo: [text,checkbox]
        Keys.onEscapePressed: {
            Qt.quit()
        }

        Text {
            id: text
            x:20
            y:20
            width: 200
            height: 30
            color: "blue"
            text: qsTr("Move me !")
            font{
                bold:true
                pixelSize:24
            }

            Keys.onPressed: {
                switch(event.key){
                    case Qt.Key_Left:
                        x -= 10
                        break
                    case Qt.Key_Right:
                        x += 10
                        break
                     case Qt.Key_Down:
                         y += 10
                         break
                     case Qt.Key_Up:
                         y -= 10
                         break
                     default:
                         return
                }
                event.accepted = true
            }
        }

        CheckBox{
            id:checkbox
            text:"Select me!"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
        }

    }
}
