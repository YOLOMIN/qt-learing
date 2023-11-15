#include "mainwindow.h"
#include <QLabel>
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;

//    QLabel label("Hello,world");
//    label.show();

    w.show();
    return a.exec();
}
