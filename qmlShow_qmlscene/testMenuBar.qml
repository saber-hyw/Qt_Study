// import QtQuick 2.3
// import QtQuick.Controls 2.4 // for ApplicationWindow
// import QtQuick.Layouts 1.3
// import QtQuick.Window 2.3
// import Qt.labs.platform 1.0 // for dialog , close window

// ApplicationWindow {
//     id: windRoot
//     // set minimum window size
//     minimumWidth: 650
//     minimumHeight: 450
//     visible: true
//     title: "OYMotion PlatForm";

//     menuBar: MenuBar {
//         // height: 20; Menubar 可以布局
//         Menu {
//             title: qsTr("&File")
//             Action { text: qsTr("&New...") }
//             Action { text: qsTr("&Open...") }
//             Action { text: qsTr("&Save") }
//             Action { text: qsTr("Save &As...") }
//             MenuSeparator { }
//             Action { text: qsTr("&Quit") }
//         }
//         Menu {
//             title: qsTr("&Edit")
//             Action { text: qsTr("Cu&t") }
//             Action { text: qsTr("&Copy") }
//             Action { text: qsTr("&Paste") }
//         }
//         Menu {
//             title: qsTr("&Help")
//             Action { text: qsTr("&About") }
//         }
//       }
// } 


import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

ApplicationWindow {
//    id: name
    width: 640
    height: 480
    visible: true
    title:qsTr("hello World");
    /*
//    Text {
//        width: 100;
//        height: 100;
////        text:msg.author
//    }
//    Loader{
//        anchors.fill: parent;
//        sourceComponent: rect;
//    }

//    Component{
//        id:rect;
//        Rectangle{
//            width: 50;
//            height: 50;
//            color:'red'
//        }
//    }
*/

    Action{
        id:quitAction
        text:qsTr("Quit");
        shortcut: "ctrl+Q";
        onTriggered: Qt.quit()
    }
    Action{
        id:cutAction;text:qsTr("Cut");
        shortcut: "ctrl+X";
        onTriggered: Qt.quit()
    }

    Action{
        id:copyAction;text:qsTr("Copy");
        shortcut: "Ctrl+C";
        onTriggered: Qt.quit()
    }
    Action{
        id:pasteAction;
        text:qsTr("Paste");
        shortcut: "Ctrl+P";
        onTriggered: Qt.quit()
    }
    menuBar:
        MenuBar{
            Menu{
                title: qsTr("File")
                MenuItem{
                    text:"open"
                    action: quitAction
                }
            }

            Menu{
                title: qsTr("Edit")
                MenuItem {
                    text:"剪切"
                    action:cutAction
                }
                MenuItem {
                    text:"复制"
                    action:copyAction
                }
                MenuItem {
                    text:"粘贴"
                    action:pasteAction
                }
            }
}
    toolBar: ToolBar{
        id:mainToolBar
        width:parent.width
        Row{
            anchors.fill: parent
            ToolButton{action:cutAction}
            ToolButton{action:copyAction}
            ToolButton{action:pasteAction}

        }
    }
    Button{
        text:qsTr("Hello World");

        anchors.horizontalCenter: parent.horizontalCenter;

        anchors.verticalCenter: parent.verticalCenter
    }
}
