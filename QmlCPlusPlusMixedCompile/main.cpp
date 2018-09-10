#include <QtGui>  // 图形用户界面开发的最基础的类
#include <QtQml>  // 提供一个运行qml的环境，由QtQml模块下面的C++代码实现；它由一个负责执行QML的引擎，持有访问每个组件属性的上下文和实例化的QML元素组件组成；

#include "registera.h"

int main(int argc, char **argv)
{
    /**
    一、这是最基础的加载QML界面的方式: 以引擎load qml 文件的方式
        1.在这个例子中，QGuiApplication封装了所有与应用程序引用相关的属性（例如应用程序名称，命令行参数，和事件循环管理）。
        QQmlApplicationEngine分层管理上下文和组件的顺序。
        它需要加载一个典型的qml文件作为应用程序的开始点。在这个例子中，main.qml包含了以一个窗口和一个文本。
    **/
    QGuiApplication app(argc,argv);
    QUrl source(QStringLiteral("qrc:/main.qml"));  // QUrl类为处理url提供了一个方便的接口
    QQmlApplicationEngine engine;
    // 暂时在engine之后，添加注册的code
    qmlRegisterType<RegisterA>("oymRegisterA", 1, 0, "RegisterA");  // 注册将类RegisterA注册到Qt元对象系统中；
    engine.load(source);

    return app.exec();
}
