import QtQuick 2.9
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
        id : grid
        anchors.fill: parent
        rows    : 12
        columns : 12
        property double colMulti : grid.width / grid.columns
        property double rowMulti : grid.height / grid.rows
        function prefWidth(item){
            return colMulti * item.Layout.columnSpan
        }
        function prefHeight(item){
            return rowMulti * item.Layout.rowSpan
        }

        Rectangle {
            color : 'red'
            Layout.rowSpan   : 10
            Layout.columnSpan: 2
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
        Rectangle {
            color : 'yellow'
            Layout.rowSpan   : 10
            Layout.columnSpan: 10
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
        Rectangle {
            id : greenRect
            color : 'green'
            Layout.rowSpan : 2
            Layout.columnSpan : 12
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
        }
    }
}
