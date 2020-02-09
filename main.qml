import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.6
import QtQuick.Layouts 1.12

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
            text: "Big stitches (row; col; centerX; centerY)"
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

                //validator: DoubleValidator{}
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

                validator: DoubleValidator{}
            }
        }

        Button {
            text: "Generate"

            onClicked: generator.generateStitches(Number.fromLocaleString(Qt.locale("ru_RU"), input1.text),Number.fromLocaleString(Qt.locale("ru_RU"), input2.text),46,20,Number.fromLocaleString(Qt.locale("ru_RU"), input3.text),Number.fromLocaleString(Qt.locale("ru_RU"), input4.text))
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
            text: "Small stitches (row; col; centerX; centerY)"
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
                id: input5
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
                id: input6
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
                id: input7
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                validator: DoubleValidator{}
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
                id: input8
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                //validator: DoubleValidator{}
            }
        }

        Button {
            text: "Generate"

            onClicked: generator.generateStitches(Number.fromLocaleString(Qt.locale("ru_RU"), input5.text),Number.fromLocaleString(Qt.locale("ru_RU"), input6.text),46,12.85,Number.fromLocaleString(Qt.locale("ru_RU"), input7.text),Number.fromLocaleString(Qt.locale("ru_RU"), input8.text))
        }
    }
    Button {
        anchors.top:small.bottom

        text: "Clear file"

        onClicked: generator.clearFile()
    }
}
