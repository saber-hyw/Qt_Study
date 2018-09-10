#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QObject>
#include <QThread>
#include <QDebug>

class myThread : public QObject
{
    Q_OBJECT
public:
    myThread();
    ~myThread();

public slots:
    void onStartNewThread();
    void firstThread();
    void secondThread();
    void thirdThread();
};

#endif // MYTHREAD_H
