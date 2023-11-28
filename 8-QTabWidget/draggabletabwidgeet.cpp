#include "draggabletabwidgeet.h"

DraggableTabWidgeet::DraggableTabWidgeet(QWidget *parent):QTabWidget(parent),isDragging(false)
{

}

void DraggableTabWidgeet::mousePressEvent(QMouseEvent *event)
{
    if(event->button() == Qt::LeftButton){
        startPos = event->pos();
        isDragging = true;
    }
    QTabWidget::mousePressEvent(event);
}

void DraggableTabWidgeet::mouseMoveEvent(QMouseEvent *event)
{
    if(isDragging){
        int distance = event->x() - startPos.x();
        if(distance > dragThreshold){
            //向着右边拖动
            int currentIndex = this->currentIndex();
            if(currentIndex > 0){
                setCurrentIndex(currentIndex-1);
                startPos =event->pos();
            }
        }else if(distance < -dragThreshold){
            //左边拖动
            int currentIndex = this->currentIndex();
            if(currentIndex < count() -1){
                setCurrentIndex(currentIndex+1);
                startPos =  event->pos();
            }
        }
    }
    QTabWidget::mouseMoveEvent(event);
}

void DraggableTabWidgeet::mouseReleaseEvent(QMouseEvent *event)
{
    if(event->button() == Qt::LeftButton){
        isDragging = false;
    }
    QTabWidget::mouseReleaseEvent(event);
}
