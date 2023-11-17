#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    //创建复选框
    QCheckBox *checkBox = new QCheckBox("Enable Feature",this);


    //创建单选按钮组
    QButtonGroup *buttonGroup = new QButtonGroup(this);

    //创建单选按钮
    QRadioButton *radioButton1 = new QRadioButton("Option 1",this);
    QRadioButton *radioButton2 = new QRadioButton("Option 2",this);

    //添加单选按钮到按钮组
    buttonGroup->addButton(radioButton1);
    buttonGroup->addButton(radioButton2);

    //创建标签用于显示状态
    QLabel *label = new QLabel("Status:Feature Disabled",this);
    label->setObjectName("label");

    //创建中心小部件
    QWidget *centralWidget = new QWidget(this);

    //创建布局管理器
    QVBoxLayout *layout = new QVBoxLayout(centralWidget);

    //将复选框，单选按钮和标签添加到布局中
    layout->addWidget(checkBox);
    layout->addWidget(radioButton1);
    layout->addWidget(radioButton2);
    layout->addWidget(label);

    //链接状态变化事件
    connect(checkBox,&QCheckBox::stateChanged,this,&MainWindow::handleCheckBoxStateChanged);
    connect(radioButton1,&QRadioButton::toggled,this,&MainWindow::handleRadioButtonToggled);
    connect(radioButton2,&QRadioButton::toggled,this,&MainWindow::handleRadioButtonToggled);

    //设置中心小部件的布局
    centralWidget->setLayout(layout);

    //设置中心小部件
    setCentralWidget(centralWidget);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::handleCheckBoxStateChanged(int state)
{
    QLabel *label = findChild<QLabel*>("label");
    if(label){
        label->setText(state == Qt::Checked?"Status:Feature Enabled":"Status Feature Disabled");
    }
}

void MainWindow::handleRadioButtonToggled(bool checked)
{
    QRadioButton *radioButton = qobject_cast<QRadioButton*>(sender());
    QLabel *label = findChild<QLabel*>("label");
    if(label){
        label->setText(checked?"Status: "+radioButton->text()+ " Selected" : "Status: None Selected");
    }
}

