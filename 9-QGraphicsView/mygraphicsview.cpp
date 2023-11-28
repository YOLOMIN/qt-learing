#include "mygraphicsview.h"

myGraphicsView::myGraphicsView(QWidget *parent):QGraphicsView(parent),isDragging(false)
{
    //创建场景
    scene = new QGraphicsScene(this);
    //设置场景的范围
    scene->setSceneRect(-200,-200,400,400);
    //创建椭圆项目并添加到场景中
    QGraphicsEllipseItem *ellipseItem = new QGraphicsEllipseItem(-50,-50,100,100);
    ellipseItem->setPos(0,0);
    scene->addItem(ellipseItem);

    //设置场景
    setScene(scene);

    //启用鼠标和键盘事件
    setMouseTracking(true);
    //启用抗锯齿效果，以使绘制的图形看起来更平滑。
    setRenderHint(QPainter::Antialiasing);

//    connect(this,&myGraphicsView::keyPressEvent,this,&myGraphicsView::ha)

}

void myGraphicsView::mouseMoveEvent(QMouseEvent *event)
{
    QGraphicsView::mouseMoveEvent(event);
    qDebug()<<"Mouse Moved:"<<mapToScene(event->pos());
}

void myGraphicsView::keyPressEvent(QKeyEvent *event)
{
    qDebug()<<"Key Pressed:"<<event->text();
    //调用父类的处理函数
    QGraphicsView::keyPressEvent(event);
}

