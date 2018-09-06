import QtQuick 2.3
import QtQuick.Controls 2.2 // for Application
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3 // for Layout

ApplicationWindow {
    id: root
    // 以下代码获取屏幕分辨率（宽高）
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true

    Rectangle {
        width: root.width/2
        height: root.height/2
        color: "gray"
        anchors.centerIn: parent

        ColumnLayout {
            id: layout
            anchors.fill: parent

            Text {
                id: showdpi0
                Layout.alignment: Qt.AlignCenter
                text: qsTr("dpi width = " + root.width)
                font.pointSize: 15
            }
            Text {
                id: showdpi1
                Layout.alignment: Qt.AlignCenter
                text: qsTr("dpi heigt = " + root.height)
                font.pointSize: 15
            }
        }
    }
//    Component.onCompleted: {
//        root.visibility = Window.FullScreen;
//    }
}
