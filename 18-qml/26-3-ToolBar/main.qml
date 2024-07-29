import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("ToolBar")
    color: "lightgray"

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("‹")
                onClicked: stack.pop()
            }
            Label {
                text: "Two"
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                id: fileButton;
                text: qsTr("⋮")
                onClicked: menu.open()
            }
        }
    }
    Menu {
        id: menu
        x: fileButton.x;
        y: fileButton.y;
        Action { text: "Cut" }
        Action { text: "Copy" }
        Action { text: "Paste" }
    }

    StackView {
        id: stack
        anchors.fill: parent
    }
}
