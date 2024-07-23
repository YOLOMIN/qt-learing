import QtQuick 2.12
import QtQuick.Window 2.12


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{

        width: 320
        height: 240
        anchors.centerIn: parent
        color: "blue"
        border.width: 2
        border.color: "black"
        radius: 4

    }

    Text {
        id: text1
        text: qsTr("Hello World!")
        anchors.centerIn: parent
        font.pixelSize: 32
        font.bold:true
        font.italic:true
        font.capitalization:Font.AllUppercase
        font.family: "Corber"
        color: "orange"
    }

}
