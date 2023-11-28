#ifndef MYGRAPHICSVIEW_H
#define MYGRAPHICSVIEW_H

#include <QObject>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QGraphicsEllipseItem>
#include <QKeyEvent>
#include <QDebug>

class myGraphicsView : public QGraphicsView
{
    Q_OBJECT
public:
    myGraphicsView(QWidget *parent = nullptr);

    //在 void mouseMoveEvent(QMouseEvent *event) override 中，override 表示该函数是一个虚函数，并且它是从基类中继承的（通常是通过某个接口类
    void mouseMoveEvent(QMouseEvent *event) override;
    void keyPressEvent(QKeyEvent *event) override;
signals:
    void keyReleaseEvent(QKeyEvent *event);
private:
    QGraphicsScene *scene;
    bool isDragging;

};

#endif // MYGRAPHICSVIEW_H
