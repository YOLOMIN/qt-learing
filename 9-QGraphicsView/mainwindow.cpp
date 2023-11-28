#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    myGraphicsView *graphicsView = new myGraphicsView(this);
    setCentralWidget(graphicsView);
    connect(graphicsView,&myGraphicsView::keyPressEvent,this,&MainWindow::handleKeyPress);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::handleKeyPress(QKeyEvent *event)
{
    qDebug()<<"MainWindow :key Pressed:"<<event->text();
}

