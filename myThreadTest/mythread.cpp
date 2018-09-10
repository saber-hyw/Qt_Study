#include "mythread.h"

myThread::myThread()
{

}

myThread::~myThread()
{

}

void myThread::onStartNewThread()
{
    qDebug() <<"myThread:: start new thread id = " << QThread::currentThreadId();
}

void myThread::firstThread()
{
    qDebug() <<"myThread:: first thread id = " << QThread::currentThreadId();
}

void myThread::secondThread()
{
    qDebug() <<"myThread:: first thread id = " << QThread::currentThreadId();
}

void myThread::thirdThread()
{
    qDebug() <<"myThread:: first thread id = " << QThread::currentThreadId();
}
