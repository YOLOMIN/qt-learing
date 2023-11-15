#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);


    //创建方法一：在一个类中临时创建，将会存在函数调用完后，局部变量释放，导致界面无法正常显示控件的问题
//    QPushButton button("Click Me!",this);
    //创建方法二：在一个类中创建一个指针类型,只有在该父类释放后才会自动释放该对象!
    QPushButton *button = new QPushButton("Click Me!", this);
    // 确保按钮可见
//    button.setVisible(true);
     // 设置按钮的位置和大小
//    button->setGeometry(10, 10, 100, 30);
    //处理点击事件
    QObject::connect(button,&QPushButton::clicked,this,&MainWindow::handleClick);
    //设置按钮样式
    //样式设置方法一:样式会生效，但是对按钮其他的设置会又影响，例如setToolTip设置显示内容为空白！！
    //button.setStyleSheet("font-size:16px;background:green;color:white;");
    //样式设置方法二：样式会生效，且按钮的其他功能正常！
    button->setStyleSheet("QPushButton {color:black;font-size:16px;background:green;color:white;}");
    //设置鼠标放置在控件上的悬浮提示
    button->setToolTip("This is a QPushButton");
    //从Qt库中获取标准图标
    QIcon appIcon = qApp->style()->standardIcon(QStyle::SP_DesktopIcon);
    //设置按钮图标（当前图标资源来自Qt标准库，也可以自己设置）
    button->setIcon(appIcon);
    //显示按钮
//    button->show();

    //创建上下文菜单
    QMenu *contextMenu = new QMenu(this);

    //在上下文菜单中添加动作
    QAction *action1 = new QAction("Action 1",this);
    QAction *action2 = new QAction("Action 2",this);

    //将上下菜单添加但上下文菜单
    contextMenu->addAction(action1);
    contextMenu->addAction(action2);
    //将上下文设置给按钮
    button->setMenu(contextMenu);

    //连接动作的槽函数
    connect(action1,&QAction::triggered,this,&MainWindow::handleAction1);
    connect(action2,&QAction::triggered,this,&MainWindow::handleAction2);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::handleClick()
{
    qDebug() << "Button clicked!";
}

void MainWindow::handleAction1()
{
    qDebug() << "Action 1 triggered!";
}

void MainWindow::handleAction2()
{
     qDebug() << "Action 2 triggered!";
}

