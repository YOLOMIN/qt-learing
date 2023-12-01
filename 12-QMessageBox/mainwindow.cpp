#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //创建一个按钮，点击按钮显示对话框
    QPushButton *button = new QPushButton("Show Message Box",this);
    connect(button,&QPushButton::clicked,this,&MainWindow::showMessage);

    //将按钮设置为主创口的中心控件
    setCentralWidget(button);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::showMessage()
{
    //创建消息对话框
    QMessageBox msgBox;
    msgBox.setWindowTitle("Message Box Example");
    msgBox.setText("This is a message box.");
    msgBox.setIcon(QMessageBox::Information);
    msgBox.setStandardButtons(QMessageBox::Ok|QMessageBox::Cancel);

    //显示消息框，并获取用户的选项
    int result = msgBox.exec();

    //根据用户的选择进行相应的操作
    if(result == QMessageBox::Ok )
        qDebug()<<"User click OK";
    else
        qDebug()<<"User click Cancel";
}

