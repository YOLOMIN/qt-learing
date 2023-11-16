#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //创建下拉列表框
    QComboBox *comboBox = new QComboBox(this);

    //添加选项
    comboBox->addItem("Option 1");
    comboBox->addItem("Option 2");
    comboBox->addItem("Option 3");

    //创建标签用于显示选择的项
    QLabel *label = new QLabel("Selected Option:",this);
    label->setObjectName("label");

    //创建中心小部件
    QWidget *centralWidget = new QWidget(this);

    //创建布局管理器
    QVBoxLayout *layout = new QVBoxLayout(centralWidget);

    //将下拉列表框和标签添加到布局中
    layout->addWidget(comboBox);
    layout->addWidget(label);


    /*
     *这行代码使用了 C++11 中的模板特化和 Qt 提供的 QOverload 宏来连接 QComboBox 的 currentIndexChanged 信号到槽函数 handleComboBoxChanged。
     *在 C++11 中，QOverload 是一个用于创建模板特化的宏，以解决在使用信号槽时，特定信号有多个重载版本的问题。在这个例子中，currentIndexChanged 是 QComboBox 类的信号，它有多个重载版本，包括形如 currentIndexChanged(int) 和 currentIndexChanged(const QString&) 等。为了明确指定使用哪个版本，我们可以使用 QOverload<int>::of(&QComboBox::currentIndexChanged)，表示我们想要连接的是带有 int 参数的版本。
     *这种写法有助于避免由于信号有多个版本而导致的编译器不确定性。在之前的 Qt 版本中，通常使用 SIGNAL() 宏和 SLOT() 宏来连接信号和槽，但是在 C++11 中引入了这种更为类型安全和清晰的写法
     */
     //链接选择事件
    connect(comboBox,QOverload<int>::of(&QComboBox::currentIndexChanged),this,&MainWindow::handleComboBoxChanged);
    //设置中心小部件
    centralWidget->setLayout(layout);
    setCentralWidget(centralWidget);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::handleComboBoxChanged(int index)
{
    //获取选择的项并设置标签文本
    QComboBox *comboBox = qobject_cast<QComboBox*>(sender());
    if(comboBox){
        QLabel *label = findChild<QLabel*>("label");
        if(label){
            label->setText("Selected Option:"+comboBox->itemText(index));
        }
    }
}

