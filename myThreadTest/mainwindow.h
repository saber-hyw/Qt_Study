#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
// local
#include "mythread.h"

class mainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit mainWindow(QWidget *parent = nullptr);
    ~mainWindow();



signals:

public slots:
    // function
//    void onFirstPushed();
//    void onSecondPushed();
//    void onThreePushed();
    void onSelfPushed();
    void onExitPushed();

private:
    myThread *m_myThread;

};

#endif // MAINWINDOW_H
