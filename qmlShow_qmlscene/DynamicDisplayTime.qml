import QtQuick 2.0

Item {
    width: 300
    height: 150

    //显示
    Text{
        id: textDateTime
        text: currentDateTime();

        anchors.centerIn: parent
    }

    //当前日期时间
    function currentDateTime(){
        return Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss.zzz ddd");
    }

    //定时器
    Timer{
        id: timer
        interval: 1 //间隔(单位毫秒):1000毫秒=1秒
        repeat: true //重复
        onTriggered:{
            textDateTime.text = currentDateTime();
        }
    }

    Component.onCompleted: {
        timer.start();
    }

}

/*
Text元素用来显示日期时间,
currentDateTime函数用来获取当前日期时间,
Timer元素用来定时刷新,实现动态呈现.
*/