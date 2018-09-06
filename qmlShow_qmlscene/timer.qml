import QtQuick 2.3
import QtQuick.Controls 2.2 // for Application
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3 // for Layout
  
ApplicationWindow {
      title: qsTr("Hello World")
      width: 640
      height: 480
      visible: true

    property int times: 0

  Item {
      Timer {
          interval: 1; running: true; repeat: true
          onTriggered: {
              ++times;
              name.text = times;
              
          }
      }

        Text {
            id: name
            text: qsTr("text")
            font.pixelSize: 24
        }
  }
}