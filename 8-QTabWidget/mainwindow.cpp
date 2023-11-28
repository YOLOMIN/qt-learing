#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //创建一个QTabWidget
    tabWidget = new DraggableTabWidgeet(this);

    //创建多个选项卡页
    for(int i = 0;i < 5 ;i++){
        QWidget *tab = new QWidget(tabWidget);
        tabWidget->addTab(tab,"Tab" + QString::number(i+1));
    }

    //设置选项卡窗口为主窗口的中心小部件
    setCentralWidget(tabWidget);

    //连接选项卡变化事件
    connect(tabWidget,&QTabWidget::currentChanged,this,&MainWindow::handleTabChaanged);

//    QTimer *timer =new QTimer(this);
//    connect(timer,&QTimer::timeout,this,&MainWindow::autoScrollTab);
//    timer->start(2000);


}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::handleTabChaanged(int index)
{
    qDebug() << "Current Tab Changed:"<<index;
}

void MainWindow::autoScrollTab()
{
    int currentIndex = tabWidget->currentIndex();
    int nextIndex = (currentIndex + 1)%tabWidget->count();
    tabWidget->setCurrentIndex(nextIndex);
}

