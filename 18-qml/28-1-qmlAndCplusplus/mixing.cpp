#include "mixing.h"
#include <QDebug>

Mixing::Mixing(QObject *parent) : QObject(parent)
{

}
void Mixing::start(BALL_COLOR ballColor)
{
    qInfo()<<"start";
    QColor color;
    switch (ballColor){
        case BALL_COLOR_BLUE:
            color = Qt::blue;
            break;
        case BALL_COLOR_GREEN:
            color = Qt::green;
            break;
        case BALL_COLOR_YELLOW:
            color = Qt::yellow;
            break;
    }

    emit colorChanged(color);
}

unsigned int Mixing::Number() const
{
    return m_Number;
}

void Mixing::setNumber(const unsigned int &number)
{
    if(number != m_Number)
    {
        m_Number = number;
        emit Numberchanged();
    }
}

void Mixing::stop()
{
    qDebug() << "颜色改变啦！！！";
}
