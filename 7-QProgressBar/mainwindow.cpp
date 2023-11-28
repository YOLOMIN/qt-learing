#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    progressBar = new QProgressBar(this);

    //创建按钮用于触发更新进度
    QPushButton *startButton = new QPushButton("Start",this);

    //创建中心小部件
    QWidget *centralWidget = new QWidget(this);
    //创建布局管理器
    QVBoxLayout *layout = new QVBoxLayout(centralWidget);

    //将进度条和按钮添加到布局中
    layout->addWidget(progressBar);
    layout->addWidget(startButton);

    //连接按钮点击事件
    connect(startButton,&QPushButton::clicked,this,&MainWindow::startProgress);

    //设置中心小部件的布局
    centralWidget->setLayout(layout);
    //设置中心小部件
    setCentralWidget(centralWidget);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::startProgress()
{
    //模拟耗时操作
    for(int i=0;i <= 100; i++){
        //更新进度条
        progressBar->setValue(i);
        //让应用程序事件循环处理更新，实现进度条动态显示
        // 模拟耗时操作
                 for (int j = 0; j < 1000000; ++j) {
                     // 延时
                 }
    }
}

