import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    SwipeView {
            id: view
            currentIndex: 0
            anchors.fill: parent
            orientation: Qt.Horizontal
            interactive: true

            Rectangle {
                id: firstPage
                color: "purple"
                Text {
                    text: qsTr("First")
                    anchors.centerIn: parent
                    font.pixelSize: 25
                }
            }
            Rectangle {
                id: secondPage
                color: "blue"
                Text {
                    text: qsTr("Second")
                    anchors.centerIn: parent
                    font.pixelSize: 25
                }
            }
            Rectangle {
                id: thirdPage
                color: "green"
                Text {
                    text: qsTr("Third")
                    anchors.centerIn: parent
                    font.pixelSize: 25
                }
            }
        }

    header: TabBar {
        id: headertabBar;
        currentIndex:view.currentIndex
        TabButton {
            text: qsTr("header one");
        }
        TabButton {
            text: qsTr("header two")
        }
        TabButton {
            text: qsTr("header three")
        }
    }
}
