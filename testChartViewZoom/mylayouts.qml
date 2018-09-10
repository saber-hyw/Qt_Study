import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtCharts 2.2
import QtQml 2.2
import QtQuick.Layouts 1.11

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    GridLayout {
        id: layout
        anchors.fill: parent
        columns: 2
        rows:2

        Rectangle {
            id: rec1
            color: 'green'
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
//            Layout.maximumWidth: 300
            Layout.minimumHeight: 150
            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.AllButtons
                onClicked: {
                    if (mouse.button == Qt.LeftButton) {
                        rec2.visible = false;
                        rec3.visible = false;
                        rec4.visible = false;
                        console.log("RightButton")
                    }
                    if (mouse.button == Qt.RightButton) {
                        console.log("MiddleButton")
                        rec2.visible = true;
                        rec3.visible = true;
                        rec4.visible = true;
                    }
                }
            }
        }
        Rectangle {
            id: rec2
            color: 'red'
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
//            Layout.maximumWidth: 300
            Layout.minimumHeight: 150
            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }
        Rectangle {
            id: rec3
            color: 'red'
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 200
            Layout.preferredHeight: 100
            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }
        Rectangle {
            id: rec4
            color: 'red'
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 200
            Layout.preferredHeight: 100
            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }
    }
}

