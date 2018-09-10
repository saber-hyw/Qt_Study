#include "mainwindow.h"

// qt library
#include <QPushButton>
#include <QVBoxLayout>
//


mainWindow::mainWindow(QWidget *parent) : QMainWindow(parent),
    m_myThread(nullptr)
{
    // 初始化一个线程
    m_myThread = new myThread;
    // 布局QPushButton测试
    QPushButton *firstButton = new QPushButton(tr("first"), 0);
    connect(firstButton, SIGNAL(clicked(bool)), m_myThread, SLOT(firstThread()), Qt::QueuedConnection);
    QPushButton *secondButton = new QPushButton(tr("second"), 0);
    connect(secondButton, SIGNAL(clicked(bool)), m_myThread, SLOT(secondThread()), Qt::QueuedConnection);
    QPushButton *thirdButton = new QPushButton(tr("third"), 0);
    connect(thirdButton, SIGNAL(clicked(bool)), m_myThread, SLOT(thirdThread()), Qt::QueuedConnection);
    QPushButton *self = new QPushButton(tr("self"), 0);
    connect(self, SIGNAL(clicked()), this, SLOT(onSelfPushed()));
    QPushButton *exit = new QPushButton(tr("exit"), 0);
    connect(exit, SIGNAL(clicked()), this, SLOT(onExitPushed()));

    QVBoxLayout *layout = new QVBoxLayout;
    layout->addWidget(firstButton);
    layout->addWidget(secondButton);
    layout->addWidget(thirdButton);
    layout->addWidget(self);
    layout->addWidget(exit);

    QWidget *p = new QWidget;
    p->setLayout(layout);

    QThread *thread = new QThread;  // 创建一个线程
    m_myThread->moveToThread(thread);       // 将myThread对象，移到新线程里面去
    thread->start(); // 开启一个线程
    // 判断新的线程开启；
    connect(thread, SIGNAL(started()), m_myThread, SLOT(onStartNewThread()));

    setCentralWidget(p);

}

mainWindow::~mainWindow()
{

}

//void mainWindow::onFirstPushed() {
//    m_myThread->firstThread();
//}

//void mainWindow::onSecondPushed() {
//    m_myThread->secondThread();
//}

//void mainWindow::onThreePushed() {
//    m_myThread->thirdThread();
//}

void mainWindow::onSelfPushed() {
    qDebug() <<"mainWindow:: mainWind Self button thread id = "<< QThread::currentThreadId();
}

void mainWindow::onExitPushed() {
    close();
}


