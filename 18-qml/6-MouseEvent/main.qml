import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Mouse Event")

    Rectangle{
        id:rect
        anchors.fill: parent
        color: "green"

        MouseArea{
            //父元素的整个区域都能触发mouseArea事件
            anchors.fill: parent
            //接收左右键
            acceptedButtons: Qt.LeftButton|Qt.RightButton
            //鼠标单击事件
            onClicked: {
                if(mouse.button === Qt.RightButton){
                    Qt.quit()
                }else if (mouse.button ===  Qt.LeftButton){
                    rect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                }
            }

            onDoubleClicked: {
                console.info("点击我两次了")
            }
        }
    }


    Rectangle{
        id:rect1
        anchors.centerIn: parent
        width: 200
        height: 200
        color: "gray"
        Rectangle{
            id:smallrect
            width: 50
            height: 50
            color: "black"
            //设置透明度
            opacity: (rect1.width - smallrect.x) /  600
            MouseArea{
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAndYAxis
                drag.minimumX: 0
                drag.minimumY: 0
                drag.maximumX: rect1.width - smallrect.width
                drag.maximumY: rect1.height - smallrect.height
            }
        }
    }
}
