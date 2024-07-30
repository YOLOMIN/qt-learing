#ifndef MIXING_H
#define MIXING_H

#include <QObject>
#include <QColor>

class Mixing : public QObject
{
    Q_OBJECT
    Q_ENUMS(BALL_COLOR)
    //通过Q_PROPERTY修饰了名为number的属性，number通过Number函数读得数据，通过setNumber函数写入数据，触发信号是Numberchanged函数
    Q_PROPERTY(unsigned int number READ Number WRITE setNumber NOTIFY Numberchanged)

public:
    explicit Mixing(QObject *parent = nullptr);
    enum BALL_COLOR{
        BALL_COLOR_YELLOW,
        BALL_COLOR_BLUE,
        BALL_COLOR_GREEN,
    };

    unsigned int Number() const;
    void setNumber(const unsigned int &Number);

    Q_INVOKABLE void stop();


signals:
    void colorChanged(const QColor &color);
    void Numberchanged();

public slots:
    void start(BALL_COLOR ballColor);
private:
    unsigned int m_Number;

};

#endif // MIXING_H
