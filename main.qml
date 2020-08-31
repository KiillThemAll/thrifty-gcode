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
            text: "Big stitches (col; row; centerX; centerY)"
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

                //validator: DoubleValidator{}
            }
        }

        Button {
            text: "Generate"

            onClicked: {
                generator.generateStandardStitchesEngrave(
                            Number.fromLocaleString(Qt.locale("ru_RU"), input1.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input2.text),
                            46,
                            20,
                            Number.fromLocaleString(Qt.locale("ru_RU"), input3.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input4.text));
                generator.generateStandardStitchesCut(
                            Number.fromLocaleString(Qt.locale("ru_RU"), input1.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input2.text),
                            46,
                            20,
                            Number.fromLocaleString(Qt.locale("ru_RU"), input3.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input4.text));

            }
        }
    }

    RowLayout {
        id: bigBySize

        anchors.left: parent.left
        width: parent.width
        height: parent.height/10
        anchors.top: big.bottom

        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 10
        Layout.maximumHeight: 50
        Text {
            text: "Big stitches (width; height; centerX; centerY)"
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
                id: input13
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
                id: input14
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
                id: input15
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
                id: input16
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                //validator: DoubleValidator{}
            }
        }

        Text{
            font.pointSize: 20
            text: "With translate"
            color: "white"
        }
        Switch{
            id: withTranslateBigSwitch
        }

        Button {
            text: "Generate"

            onClicked: {
                if (withTranslateBigSwitch.checked){
                    generator.generateStandardStitches(
                           Number.fromLocaleString(Qt.locale("ru_RU"), input13.text),
                           Number.fromLocaleString(Qt.locale("ru_RU"), input14.text),
                           false,
                           true,
                           Number.fromLocaleString(Qt.locale("ru_RU"), input15.text),
                           Number.fromLocaleString(Qt.locale("ru_RU"), input16.text));
                }
                if (!withTranslateBigSwitch.checked){
                    generator.generateStandardStitches(
                           Number.fromLocaleString(Qt.locale("ru_RU"), input13.text),
                           Number.fromLocaleString(Qt.locale("ru_RU"), input14.text),
                           false);
                }
            }
        }
    }

    RowLayout {
        id: small

        anchors.left: parent.left
        width: parent.width
        height: parent.height/10
        anchors.top: bigBySize.bottom

        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 10
        Layout.maximumHeight: 50
        Text {
            text: "Small stitches (col; row; centerX; centerY)"
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

            onClicked: {
                generator.generateStandardStitchesEngrave(
                            Number.fromLocaleString(Qt.locale("ru_RU"), input5.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input6.text),
                            46,
                            12.85,
                            Number.fromLocaleString(Qt.locale("ru_RU"), input7.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input8.text));
                generator.generateStandardStitchesCut(
                            Number.fromLocaleString(Qt.locale("ru_RU"), input5.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input6.text),
                            46,
                            12.85,
                            Number.fromLocaleString(Qt.locale("ru_RU"), input7.text),
                            Number.fromLocaleString(Qt.locale("ru_RU"), input8.text));
            }
        }
    }
    RowLayout {
        id: smallBySize

        anchors.left: parent.left
        width: parent.width
        height: parent.height/10
        anchors.top: small.bottom

        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 10
        Layout.maximumHeight: 50
        Text {
            text: "Small stitches (width; height; centerX; centerY)"
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
                id: input9
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
                id: input10
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
                id: input11
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
                id: input12
                anchors.fill: parent
                focus: true
                font.pointSize: 20

                text: "3"

                //validator: DoubleValidator{}
            }
        }

        Text{
            font.pointSize: 20
            text: "With translate"
            color: "white"
        }

        Switch{
            id: withTranslateSmallSwitch
        }

        Button {
            text: "Generate"

            onClicked: {
                if (withTranslateSmallSwitch.checked){
                    generator.generateStandardStitches(
                           Number.fromLocaleString(Qt.locale("ru_RU"), input9.text),
                           Number.fromLocaleString(Qt.locale("ru_RU"), input10.text),
                           true,
                           true,
                           Number.fromLocaleString(Qt.locale("ru_RU"), input11.text),
                           Number.fromLocaleString(Qt.locale("ru_RU"), input12.text));
                }
                if (!withTranslateSmallSwitch.checked){
                    generator.generateStandardStitches(
                           Number.fromLocaleString(Qt.locale("ru_RU"), input9.text),
                           Number.fromLocaleString(Qt.locale("ru_RU"), input10.text),
                           true);
                }
            }
        }
    }
    Button {
        anchors.top:smallBySize.bottom

        text: "Clear file"

        onClicked: generator.clearFile()
    }
}
