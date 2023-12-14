#include "work.h"
#include <QApplication>
#include <QTimer>
#include <QThread>

Work::Work()
{

}

void Work::doWork()
{
    for(int i = 0;i < 100000000;i++){
        QThread::msleep(100);
        emit count(i);
    }
    emit workFinished();
}
