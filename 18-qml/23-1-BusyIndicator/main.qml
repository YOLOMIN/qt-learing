import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("BusyIndicator")
    BusyIndicator{
        id:busy
        anchors.centerIn: parent
        width: 100
        height: 100
        running: true

        contentItem: Item {
                Rectangle {
                    id: rect
                    width: parent.width
                    height: parent.height
                    color: Qt.rgba(0, 0, 0, 0)
                    radius: width / 2
                    border.width: width / 6
                    visible: false
                }

                ConicalGradient {
                    width: rect.width
                    height: rect.height
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#80c342" }
                        GradientStop { position: 1.0; color: "#006325" }
                    }
                    source: rect

                    Rectangle {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: rect.border.width
                        height: width
                        radius: width / 2
                        color: "#006325"
                    }

                    RotationAnimation on rotation {
                        from: 0
                        to: 360
                        duration: 1000
                        loops: Animation.Infinite
                    }
                }
            }
    }

    Image {
        id: image
        asynchronous: true
        cache: false
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: "http://seopic.699pic.com/photo/50046/5289.jpg_wh1200.jpg"
        onStatusChanged: {
            if(image.status === Image.Loading)
            {
                busy.running = true
            }else if(image.status === Image.Ready)
            {
                busy.running = false
            }else if(image.status === Image.Error)
            {
                busy.running = false
                console.log("error")
            }
        }
    }
}
