import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtCharts 2.2
import QtQml 2.2


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    ChartView{
        id: chart
        width: 400
        height: 400

        ScatterSeries{
            markerSize: 10
            XYPoint{x: 1; y: 1}
            XYPoint{x: 2; y: 2}
            XYPoint{x: 5; y: 5}
        }

        Rectangle{  // 不能放在外面，不然没有黑框的效果；
            id: rectang
            color: "black"
            opacity: 0.6
            visible: false
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.AllButtons  // 接受所有鼠标事件

            onPressed: {rectang.x = mouseX; rectang.y = mouseY; rectang.visible = true}
            onMouseXChanged: {rectang.width = mouseX - rectang.x}
            onMouseYChanged: {rectang.height = mouseY - rectang.y}
            onReleased: {
                    chart.zoomIn(Qt.rect(rectang.x, rectang.y, rectang.width, rectang.height))
                    rectang.visible = false
            }
            onDoubleClicked: {
                if (mouse.button == Qt.LeftButton) {
                    console.log("DoubleClicked");
                }
            }
            onClicked: {
                if (mouse.button == Qt.RightButton) {
                    console.log("RightButton")
                }
                if (mouse.button == Qt.MiddleButton) {
                    console.log("MiddleButton")
                }
            }
        }
    }
}
