import QtQuick 2.3
import QtQuick.Controls 2.2 // for Application
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3 // for Layout
  
  ApplicationWindow {
      title: qsTr("Hello World")
      width: 640
      height: 480
      visible: true

      StackView {
          id: stack
          initialItem: mainView
          anchors.fill: parent
      }

      Component {
          id: mainView

          Row {
              spacing: 10

              Button {
                  text: "Push"
                  onClicked: stack.push(mainView)
              }
              Button {
                  text: "Pop"
                  enabled: stack.depth > 1
                  onClicked: stack.pop()

              }
              Text {
                  text: stack.depth
              }
          }
      }
  }