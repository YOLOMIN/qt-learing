#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    //创建单行文本输入框
    QLineEdit *lineEdit = new QLineEdit(this);
    //创建标签用于显示文本内容
    QLabel *label = new QLabel("Text Content:",this);
    //设置对象名称
    label->setObjectName("label");
    //创建布局管理器
    QVBoxLayout *layout = new QVBoxLayout;

    //将文本输入框和标签添加到布局中
    layout->addWidget(lineEdit);
    layout->addWidget(label);

    //创建主窗口中心的小部件，并将布局设置给它
    QWidget *centralWidget = new QWidget(this);
    centralWidget->setLayout(layout);

    //设置主窗口的中央小部件
    setCentralWidget(centralWidget);


    //链接文本变化事件
    connect(lineEdit,&QLineEdit::textChanged,this,&MainWindow::handleTextChanged);


}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::handleTextChanged(const QString &text)
{
    //获取文本并设置文本内容
    //使用 findChild 函数在 MyWidget 类中查找一个具有指定对象名（objectName）的 QLabel 对象
    //在这里，"label" 是对象名。
    //如果 findChild<QLabel*>("label") 返回 nullptr（0x0），表示在当前对象的子对象中没有找到具有指定对象名（"label"）的 QLabel 对象。
   //需要检测是否有 label->setObjectName("label");
   QLabel * label = findChild<QLabel*>("label");
    if(label){
        label->setText("Text Content:"+text);
    }
}

