import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Slider")
    Column{
        anchors.centerIn: parent
        spacing: 20

        Text{
            id:rowsliderStat
            text: qsTr("水平方向当前进度10%")
            font.pixelSize: 20
            color: "green"
        }

        Slider{
            stepSize: 0.01
            from:0
            to:100
            value: 1
            orientation: Qt.Horizontal
            snapMode: "SnapAlways"
            onValueChanged: {
                rowsliderStat.text = "水平方向当前进度"+ value.toFixed(0)+"%";
            }
        }

        Text{
            id:columnsliderStat
            text: qsTr("垂直方向当前进度10%")
            font.pixelSize: 20
            color: "green"
        }

        Slider{
            stepSize: 0.01
            from:0
            to:100
            value: 1
            orientation: Qt.Vertical
            snapMode: "SnapAlways"
            onValueChanged: {
                columnsliderStat.text = "垂直方向当前进度"+ value.toFixed(0)+"%";
            }
        }


        Slider{
            id:control
            value: 0.5
//            anchors.centerIn: parent
            width: 200
            height: 20

            background: Rectangle{
                id:rect1
                width: control.availableWidth
                height: 10
                radius: 7
                color: "orange"

                Rectangle{
                    id:rect2
                    width: control.visualPosition * rect1.width
                    height: rect1.height
                    color: "red"
                    radius: 7
                }
            }

            handle: Rectangle{
                x:control.visualPosition * (control.availableWidth - implicitWidth)
                y:control.visualPosition /2 - implicitHeight/2
                implicitWidth: 20
                implicitHeight: 26
                radius: 13
                color: control.pressed?"green":"white"
                border.color: "black"
            }
        }

        RangeSlider{
            from: 1
//            anchors.centerIn: parent
            to:100
            first.value: 20
            second.value: 80
            snapMode: "SnapAlways"
            stepSize: 1
        }
    }

}
