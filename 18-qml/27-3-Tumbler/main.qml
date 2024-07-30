import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tumbler")
    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: frame.implicitWidth + 10
        height: frame.implicitHeight + 10

        function formatText(count, modelData) {
            var data = count === 12 ? modelData + 1 : modelData
            return data.toString().length < 2 ? "0" + data : data
        }

        Component {
            id: delegateComponent

            Label {
                text: rect.formatText(Tumbler.tumbler.count, modelData)
                opacity: 0.4 + (1 - Math.abs(Tumbler.displacement)) * 0.6
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 20
            }
        }

        Frame {
            id: frame
            padding: 0
            anchors.centerIn: parent

            Row {
                id: row

                Tumbler {
                    id: hoursTumbler
                    model: 24
                    delegate: delegateComponent
                }

                Tumbler {
                    id: minutesTumbler
                    model: 60
                    delegate: delegateComponent
                }

                Tumbler {
                    id: amPmTumbler
                    model: 60
                    delegate: delegateComponent
                }
            }
        }
    }
}
