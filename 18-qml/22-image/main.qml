import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("image")

    Image {
            id: image
            asynchronous: true
            cache: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "http://seopic.699pic.com/photo/50046/5289.jpg_wh1200.jpg"
        }
}
