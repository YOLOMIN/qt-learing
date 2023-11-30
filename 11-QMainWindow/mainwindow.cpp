#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //创建菜单栏
    createMenuBar();

    //创建工具栏
    createToolBar();

    //创建状态栏
    createStatusBar();

    //创建主窗口中心的文本编辑器
    textEdit = new QTextEdit(this);
    setCentralWidget(textEdit);

    //创建子窗口并添加到主窗口
    createChildWindow("Child Window 1");
    createChildWindow("Child Window 2");

    //创建停靠窗口
    creatDockWindow("Dock Window");


}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::createMenuBar()
{
    //创建File菜单栏
    QMenu *fileMenu = menuBar()->addMenu("File");

    //添加“New”动作
    QAction *newAction = fileMenu->addAction("New");
    connect(newAction,&QAction::triggered,this,&MainWindow::newFile);

    QAction *exitAction = fileMenu->addAction("Exit");
    connect(exitAction,&QAction::triggered,this,&QApplication::quit);

}

void MainWindow::createToolBar()
{
    //创建工具栏
    QToolBar *toolBar = addToolBar("File");
    //添加New动作到工具栏
    QAction *newAction = toolBar->addAction("New");
    connect(newAction,&QAction::triggered,this,&MainWindow::newFile);

}

void MainWindow::createStatusBar()
{
    //创建状态栏
    QStatusBar *statusBar = this->statusBar();

    //在状态栏中添加标签
    statusBarLabel = new QLabel("Ready",this);
    statusBar->addWidget(statusBarLabel);

}

void MainWindow::createChildWindow(const QString &title)
{
    //创建子窗口
    ChildWindow *childWindow = new ChildWindow(this);
    childWindow->setWindowTitle(title);

    //添加自创口到主窗口
    mdiArea.addSubWindow(childWindow);
    //链接子窗口的活动状态变化信号
    connect(childWindow,&QWidget::windowTitleChanged,this,&MainWindow::updateSTatusBar);

}

void MainWindow::creatDockWindow(const QString &title)
{
    //创建停靠窗口
    QDockWidget *dockWidget = new QDockWidget(title,this);
    dockWidget->setAllowedAreas(Qt::LeftDockWidgetArea|Qt::RightDockWidgetArea);

    //在停靠窗口中添加一个文本编辑器
    QTextEdit *dockTextEdit = new QTextEdit(dockWidget);
    dockWidget->setWidget(dockTextEdit);

    addDockWidget(Qt::RightDockWidgetArea,dockWidget);
}

void MainWindow::newFile()
{
    createChildWindow("New child Window");
}

void MainWindow::updateSTatusBar(const QString &title)
{
    statusBarLabel->setText(title);
}

