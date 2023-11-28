#ifndef DRAGGABLETABWIDGEET_H
#define DRAGGABLETABWIDGEET_H

#include <QObject>
#include <QTableWidget>
#include <QMouseEvent>
#include <QDebug>

class DraggableTabWidgeet : public QTabWidget
{
    Q_OBJECT
public:
    DraggableTabWidgeet(QWidget *parent = nullptr);
protected:
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent * event);
    void mouseReleaseEvent(QMouseEvent *event);

private:
    QPoint startPos;
    bool isDragging;
    int dragThreshold = 30;
};

#endif // DRAGGABLETABWIDGEET_H
