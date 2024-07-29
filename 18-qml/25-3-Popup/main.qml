import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Popup")
    color:"lightgray"

    Button {
        text: "Open"
        anchors.centerIn: parent
        onClicked: popup.open()
    }

    Popup {
        id: popup
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 200
            border.color: "green"
        }
        contentItem: Column {
            Column {
                CheckBox { text: qsTr("语文") }
                CheckBox { text: qsTr("数学") }
                CheckBox { text: qsTr("英语") }
            }
        }
    }
}
