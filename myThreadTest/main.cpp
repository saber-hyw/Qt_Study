
#include "mainwindow.h"
#include <QtWidgets/QApplication>
#include <QtWidgets/QMainWindow>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    mainWindow w;
    w.resize(900, 600);
    w.show();
    return a.exec();
}
