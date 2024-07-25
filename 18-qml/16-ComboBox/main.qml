import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ComboBox")
    color: "lightyellow"
    //填充整数
    ComboBox{
        id:comboboxInt
        anchors.centerIn: parent
        model:[1,2,3,4,5,6,7,8,9]
        onActivated: {
            console.info(displayText)
        }
    }
    //填充ListModel
    ComboBox{
        id:comboboxListModel
        editable: true
        anchors.top: comboboxInt.bottom
        anchors.left: comboboxInt.left
        model:ListModel{
            id:num
            ListElement{text:"One"}
            ListElement{text:"Two"}
            ListElement{text:"Three"}
        }
        onAccepted: {
            if(find(editText) === -1)
                num.append({text:editText})
        }
    }
    //自定义
    ComboBox{
        id:control
        anchors.top: comboboxListModel.bottom
        anchors.left: comboboxListModel.left
        model: ["One","Two","Three"]
        delegate: ItemDelegate{
            width: control.width
            contentItem: Text{
                text: modelData
                color: "green"
                font:control.font
                verticalAlignment: Text.AlignVCenter
            }
        }
        contentItem: Text{
            leftPadding: 5
            text:control.displayText
            font:control.font
            color: control.pressed?"orange":"black"
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle{
            implicitWidth: 120
            implicitHeight: 40
            color: "green"
            border.width: 1
            radius: 2
        }
        popup: Popup{
            y:control.height
            width: control.width
            implicitHeight: contentItem.implicitHeight
            padding: 1
            contentItem: ListView{
                clip: true
                implicitHeight: contentHeight
                model: control.popup.visible?control.delegateModel:null
            }
            background: Rectangle{
                border.color: "green"
                radius: 2
            }
        }
    }

}
