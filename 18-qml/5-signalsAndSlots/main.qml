import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Signals and slots")

    Rectangle{
        id:rect
        anchors.fill: parent
        color: "red"
        property int clickcount: 0
        //自定义无参信号
        signal signal1
        //自定义有参信号
        signal signal2(string str,int value)

        signal signalStr1(string str)
        signal signalStr2(string str)

        Row{
            id:row
            anchors.centerIn: rect
            Label{
                id:text1
                text:"a"
                padding: 80
            }
            Label{
                id:text2
                text:"b"
                padding: 80
            }
            Label{
                id:text3
                text:"c"
                padding: 80
            }
        }

        Button{
            id:changeABC
            anchors.top:row.bottom
            anchors.horizontalCenter: rect.horizontalCenter
            text:"变成大写"
            onClicked:{
                rect.signalStr1("变成大写了！！！")
            }
        }

        Button{
            id:changeColor
            width: 100
            height: 30
            text:"改变颜色"
            anchors.top: changeABC.bottom
        }

        Button{
            id:buttonClick
            text:"点击我"
            anchors.top: changeColor.bottom
            onClicked: {
                rect.clickcount++
                rect.signal2("点击第",rect.clickcount)
                if(rect.clickcount % 5 === 0){
                    rect.signal1()
                }
            }
        }

        Button{
            id:quit
            width: 100
            height: 30
            text:"quit"
            anchors.top:buttonClick.bottom
            //信号处理器
            onClicked: {
                Qt.quit()
            }
        }
        //Connections信号
        Connections{
            target: changeColor
            onClicked:{
                rect.color = "green"
            }
        }

        Component.onCompleted: {
            rect.signalStr1.connect(method1)
            rect.signalStr1.connect(method2)
            rect.signalStr1.connect(method3)
            rect.signalStr1.connect(rect.signalStr2)
        }

        onSignalStr2:  {
            console.info(str)
        }

        function method1(){
            text1.text = "A"
        }

        function method2(){
            text2.text = "B"
        }

        function method3(){
            text3.text = "C"
        }

        onSignal1: {
            rect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
        }

        onSignal2: {
            console.info(str,value,"次")
        }

    }

    Item{
        width:100
        height: 100
        focus: true
        Keys.enabled: true
        //附加信号处理器---需要回车才能触发
        Keys.onReturnPressed: console.info("哈哈哈哈后")
    }


}
