import QtQuick 2.0

Rectangle {
    id:contair
    width: rad * 2
    height: rad * 2
    color: backColor
    radius: 720

    property var run: true
    property var arc: 230
    property var backColor: "#00000000"
    property var arcColor: "#5f8aa4"
    property var fontColor: "#5f8aa4"
    property var borderColor: "#5f8aa4"
    property string txt: "Please Wait for a while."
    property string endText: "The project has been loaded."
    property var endWaitTime: 1200
    property var rad: 250

    property var arcWidth: 6
    Text {
        id:textInfo
        font.pixelSize: 16
        font.family: "微软雅黑"
        anchors.centerIn: parent
        color:fontColor
        state: "runningText"
        states:[
            State{
                name:"runningText"
                changes: [
                    PropertyChanges {
                        target: textInfo;
                        text : txt
                    }
                ]
            },
            State{
                name:"endingText"
                when:hideText.complete()
                changes: [
                    PropertyChanges {
                        target: textInfo;
                        text : endText
                    }
                ]
            }
        ]
    }
    onArcChanged: canvas.requestPaint();
    //结束动画
    onRunChanged:
        SequentialAnimation{
        NumberAnimation{
            id:hideText
            target: textInfo
            property: "opacity"
            to:0
            duration: 500
            onStopped: textInfo.state = "endingText"
            easing.type: Easing.InBack
        }
        NumberAnimation{
            target: textInfo
            property: "opacity"
            to:1
            duration: 500
            easing.type: Easing.OutBack
            onStopped: running.stop();
        }
        NumberAnimation {
            target: contair
            property: "endWaitTime"
            duration: endWaitTime
            to:0
        }
        ParallelAnimation{
        NumberAnimation {
            target: contair
            property: "scale"
            duration: 500
            to:0.5
            easing.type: Easing.InBack
        }
        NumberAnimation {
            target: contair
            property: "opacity"
            duration: 500
            to:0
            easing.type: Easing.InBack
        }
        onStopped: contair.destroy()
    }}

    //加载动画
    Component.onCompleted: ParallelAnimation{
        NumberAnimation {
            target: contair
            property: "scale"
            duration: 250
            from: 0.5
            to:1
            easing.type: Easing.OutBack
        }
        NumberAnimation {
            target: contair
            property: "opacity"
            duration: 250
            from:0.5
            to:1
            easing.type: Easing.OutBack
        }
        onStopped: running.start()

    }


    NumberAnimation{
        id: running
        target: canvas
        property: "rotation"
        duration: 2000
        to: 360
        easing.type: Easing.Linear
        onStopped: NumberAnimation {
            id: toZero
            target: canvas
            property: "rotation"
            duration: run != false ? 1 : 1000
            to:0
            easing.type: Easing.OutBack
            onStopped: if(run != false) running.start();
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: run = false
    }

    Canvas{
        id: canvas
        anchors.fill: parent
        contextType: "2d"
        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = arcWidth
            ctx.strokeStyle = arcColor
            ctx.beginPath();
            ctx.arc(rad,rad,rad - arcWidth,Math.PI/180 * 270,Math.PI/180 * arc,false);
            ctx.stroke();
        }
    }
}