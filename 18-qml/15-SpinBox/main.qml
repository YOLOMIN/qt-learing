import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Spin Box")
    //整数值轮选框
    SpinBox{
        id:spinboxInt
        anchors.centerIn: parent
        from:0
        to:50
        value: 20
        stepSize: 2
    }

    //浮点数轮选框
    SpinBox{
        id:spinboxFloat
        from:0
        value: 110
        to:100 * 100
        stepSize: 10
        anchors.top:spinboxInt.bottom
        anchors.left:spinboxInt.left

        validator: DoubleValidator{
            bottom: Math.min(spinboxFloat.from,spinboxFloat.to)
            top:Math.max(spinboxFloat.from,spinboxFloat.to)
        }

        textFromValue: function(value,locale){
            return Number(value / 100).toLocaleString(locale,'f',2)
        }

        valueFromText: function(text,locale){
            return Number.fromLocaleString(locale,text)
        }
    }

    //文本轮选框
    SpinBox{
        id:spinboxText
        from:0
        to:items.length - 1
        value: 1 // "Medium"
        anchors.top: spinboxFloat.bottom
        anchors.left: spinboxFloat.left

        property  var  items: ["Small","Medium","Large"]
        //RegExpValidator类型提供了一个验证器，该验证器会将与指定正则表达式匹配的任何字符串视为有效。
        validator: RegExpValidator{
            regExp: new RegExp("(Small|Medium|Large)","i")
        }

        textFromValue: function(value){
            return items[value]
        }

        valueFromText: function(text){
            for(var i = 0;i < items.length;i++){
                if(items[i].toLowerCase().indexOf(text.toLowerCase()) == 0)
                    return i
            }
            return sb.value
        }
    }

    //自定义轮选框
    SpinBox{
        id:control
        value: 50
        editable: true
        anchors.top: spinboxText.bottom
        anchors.left: spinboxText.left

        contentItem: TextInput{
            text: control.textFromValue(control.value,control.locale)
            font: control.font
            color: "green"
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            readOnly: !control.editable
            validator: control.validator
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }

        up.indicator: Rectangle{
            x:parent.width - implicitWidth
            implicitWidth: 40
            implicitHeight: 40
            color: control.up.pressed?"lightgray":"orange"
            border.color: "green"

            Text{
                text: "+"
                font.pixelSize: control.font.pixelSize * 2
                color: "green"
                anchors.fill: parent
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }

        down.indicator: Rectangle{
            x:0
            implicitWidth: 40
            implicitHeight: 40
            color: control.down.pressed?"lightgray":"orange"
            border.color: "green"

            Text{
                text: "-"
                font.pixelSize: control.font.pixelSize * 2
                color: "green"
                anchors.fill: parent
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        background: Rectangle{
            implicitWidth: 140
            border.color: "green"
        }
    }
}
