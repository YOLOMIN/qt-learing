#ifndef WORK_H
#define WORK_H
#include <QObject>


class Work:public QObject
{
    Q_OBJECT

public:
    Work();
public Q_SLOTS:
    void doWork();
Q_SIGNALS:
    void workFinished();
    void count(int id);

};

#endif // WORK_H
