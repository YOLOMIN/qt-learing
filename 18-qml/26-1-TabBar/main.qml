import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TabBar")

    TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
        TabButton {
            text: qsTr("Third")
        }
    }

    StackLayout {
        anchors.centerIn: parent
        width: parent.width
        currentIndex: bar.currentIndex
        Item {
            Text {
                anchors.centerIn: parent
                text: qsTr("First")
            }
        }
        Item {
            Text {
                anchors.centerIn: parent
                text: qsTr("Second")
            }
        }
        Item {
            Text {
                anchors.centerIn: parent
                text: qsTr("Third")
            }
        }
    }
}
