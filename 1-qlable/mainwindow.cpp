#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QLabel>
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //错误调用方式之一：局部变量，导致界面上该控件无法显示；
//  QLabel label("Hello,world");
//  label.setParent(this);
//  label.show();

      //设置文本内容
      label.setText("Hello,world");
      //设置父类（有时候没有显示出来就是由于没有设置当前窗口为该label的父类导致的）
      label.setParent(this);
      //设置label的样式（和web的样式相同）
      label.setStyleSheet("font-size: 24px; color: blue;");

      //设置图片
      QPixmap pixmap(":/new/prefix1/test.jpg");
      pixmap = pixmap.scaled(label.size());
      label.setPixmap(pixmap);

      label.show();
}

MainWindow::~MainWindow()
{
    delete ui;
}

