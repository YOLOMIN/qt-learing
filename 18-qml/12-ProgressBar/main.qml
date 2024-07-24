import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ProgressBar")

    Column{
        anchors.centerIn: parent
        anchors.margins: 50
        spacing: 50

        ProgressBar{
            //范围的起始值
            from:0.0
            //结束值
            to:0.6
            value: 0.3
            width: 100
            height: 20
        }

        ProgressBar{
            value: 0.1
            width: 100
            height: 2
            Timer{
                interval: 1000
                repeat: true
                running: true
                onTriggered: {
                    if(parent.value < 1.0){
                        parent.value += 0.1
                    }else{
                        stop()
                    }
                }
            }
        }

        ProgressBar{
            value: 0.2
            width: 100
            height: 20
            //BusyIndicator模式
            indeterminate: true
        }

        ProgressBar{
            id:control
            value: 0.2
            width: 100
            height: 20
            background: Rectangle{
                implicitWidth: control.width
                implicitHeight: control.height
                color: "orange"
                radius: 3
            }
            contentItem: Item{
                Rectangle{
                    width: control.visualPosition * control.width
                    height: control.height
                    radius: 2
                    color: "green"
                }
            }
        }
    }


}
