import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    id: appwnd
    property int columns : 3;

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("2 columns")
                onTriggered: {
                    columns = 2;
                    grid.cellWidth = grid.width/columns;
                }
            }
            MenuItem {
                text: qsTr("3 columns")
                onTriggered: {
                    columns = 3;
                    grid.cellWidth = grid.width/columns;
                }
            }
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: width / 3;
        cellHeight: 300;
        model: ListModel {
            ListElement {
                name: "Apple"
                cost: 2.45
            }
            ListElement {
                name: "Orange"
                cost: 3.25
            }
            ListElement {
                name: "Banana"
                cost: 1.95
            }
        }
        delegate : Rectangle {
            //anchors.fill: parent
            width: grid.cellWidth
            height: grid.cellHeight
            border.color: "green"
            border.width: 2
            color: "red"
        }
        onWidthChanged: {
            grid.cellWidth = grid.width/appwnd.columns;
        }
    }
}