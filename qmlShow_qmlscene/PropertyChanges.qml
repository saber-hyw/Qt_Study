import QtQuick 2.0

Item {
    id: container
    width: 300; height: 300

    Rectangle {
        id: rect
        width: 100; height: 100
        color: "red"

        MouseArea {
           id: mouseArea
           anchors.fill: parent
        }

        states: State {
           name: "resized"; when: mouseArea.pressed
           PropertyChanges { target: rect; color: "blue"; height: container.height }
        }
    }
}