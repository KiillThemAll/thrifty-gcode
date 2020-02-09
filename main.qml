import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.6
import QtQuick.Layouts 1.12
import QtDataVisualization 1.2

Window {
    id: gcodeWindow
    visible: true
    width: 1920
    height: 1080
    title: qsTr("Stitches gcode")
    color: "#161616"

    RowLayout {
        id: big
        anchors.left: parent.left
        width: parent.width
        height: parent.height/10

        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 10
        Layout.maximumHeight: 50
        Text {
            text: "Big stitches (row/col)"
            color: "gray"
            font.pointSize: 25
        }

        FocusScope {
            width: 96; height: 30
            Rectangle {
                anchors.fill: parent
                color: "lightsteelblue"
                border.color: "gray"

            }

            TextInput {
                id: input1
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                validator: IntValidator{bottom:0; top:1000}
            }
        }



        FocusScope {
            width: 96; height: 30
            Rectangle {
                anchors.fill: parent
                color: "lightsteelblue"
                border.color: "gray"

            }

            TextInput {
                id: input2
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                validator: IntValidator{bottom:0; top:1000}
            }
        }

        Button {
            text: "Generate"

            onClicked: generator.generateStitches(parseInt(input1.text, 10),parseInt(input2.text, 10),46,20)
        }
    }


    RowLayout {
        id: small

        anchors.left: parent.left
        width: parent.width
        height: parent.height/10
        anchors.top: big.bottom

        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 10
        Layout.maximumHeight: 50
        Text {
            text: "Small stitches (row/col)"
            color: "gray"
            font.pointSize: 25
        }

        FocusScope {
            width: 96; height: 30
            Rectangle {
                anchors.fill: parent
                color: "lightsteelblue"
                border.color: "gray"

            }

            TextInput {
                id: input3
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                validator: IntValidator{bottom:0; top:1000}
            }
        }



        FocusScope {
            width: 96; height: 30
            Rectangle {
                anchors.fill: parent
                color: "lightsteelblue"
                border.color: "gray"

            }

            TextInput {
                id: input4
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                validator: IntValidator{bottom:0; top:1000}
            }
        }

        Button {
            text: "Generate"

            onClicked: generator.generateStitches(parseInt(input3.text, 10),parseInt(input4.text, 10),46,12.85)
        }
    }
}
