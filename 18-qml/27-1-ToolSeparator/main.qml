import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ToolSeparator")

    ToolBar {
        id:toolbar
        anchors.centerIn: parent
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: qsTr("Action 1")
            }

            ToolSeparator {
                contentItem: Rectangle {
                    implicitWidth: 3
                    implicitHeight: toolbar.height - 20
                    color: "orange"
                }
            }

            ToolButton {
                text: qsTr("Action 2")
            }

        }
    }
}
