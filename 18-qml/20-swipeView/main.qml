import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("滑动导航模型SwipeView")
    SwipeView{
        id:view
        currentIndex: 0
        anchors.fill: parent
        orientation: Qt.Horizontal
        interactive: true

        Rectangle{
            id:firstPage
            color: "purple"
            Text{
                text:qsTr("First")
                anchors.centerIn: parent
                font.pixelSize: 25
            }
        }

        Rectangle{
            id:secondPage
            color: "blue"
            Text{
                text:qsTr("Second")
                anchors.centerIn: parent
                font.pixelSize: 25
            }
        }

        Rectangle{
            id:thirdPage
            color: "green"
            Text{
                text:qsTr("Third")
                anchors.centerIn: parent
                font.pixelSize: 25
            }
        }

        Page{
            header: Rectangle{
                height: 80
                color: "orange"
                Text{
                    anchors.centerIn: parent
                    text: "First"
                    font.pixelSize: 25
                }
            }

            footer: Rectangle{
                height: 30
                color: "orange"
            }
        }
    }

    PageIndicator{
        id: pageIndicator
        interactive: true
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
