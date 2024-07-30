import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ToolTip")

    Row{
        anchors.centerIn: parent
        spacing: 30;

        Button {
            text: qsTr("Button")
            hoverEnabled: true

            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("这是提示")
        }

        Slider{
            id: slider
            value: 0.5

            ToolTip {
                parent: slider.handle
                visible: slider.pressed
                text: slider.value.toFixed(1)
            }
        }
    }
}
