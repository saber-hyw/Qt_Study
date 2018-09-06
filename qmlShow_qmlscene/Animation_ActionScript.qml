import QtQuick 2.0

Item {
    Text {
        id: text
        text: "d"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                text.state = "ChangeText"
            }
        }
        states: [
            State {
                name: "ChangeText"
                PropertyChanges {
                    target: text
                    x: 10
                }
            }
        ]
        transitions: [
            Transition {
                from: "*"
                to: "ChangeText"
                SequentialAnimation {
                    NumberAnimation {
                        properties: "x"
                        duration: 1000
                    }
                    ScriptAction {
                        script: {
                            text.text = "ddd"
                        }
                    }
                }
            }
        ]
    }
}