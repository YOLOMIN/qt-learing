#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QPushButton *button = new QPushButton("Start Task",this);
    connect(button,&QPushButton::clicked,this,&MainWindow::startTask);

    countLabel = new QLabel("count",this);

    QWidget* centerWidget = new QWidget;
    setCentralWidget(centerWidget);

    QHBoxLayout* layout = new QHBoxLayout(this);
    layout->addWidget(button);
    layout->addWidget(countLabel);

    centerWidget->setLayout(layout);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::startTask()
{
    QThread *thread = new QThread;

    Work * worker = new Work;

    worker->moveToThread(thread);

    connect(thread,&QThread::started,worker,&Work::doWork);

    connect(worker,&Work::workFinished,thread,&QThread::quit);
    connect(worker,SIGNAL(count(int)),this,SLOT(countText(int)));
    connect(thread,&QThread::finished,thread,&QThread::deleteLater);
    connect(thread,&QThread::finished,worker,&Work::deleteLater);

    QMessageBox::information(this,"Task Started","Task has started in a separate thread.");

    thread->start();
}

void MainWindow::countText(int id)
{
    countLabel->setNum(id);
}

