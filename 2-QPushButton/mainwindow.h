﻿#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QDebug>
#include <QToolTip>  // 确保包含这个头文件
#include <QStyle>
#include <QIcon>
#include <QMenu>
#include <QAction>


QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void handleClick();
    void handleAction1();
    void handleAction2();

private:
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
