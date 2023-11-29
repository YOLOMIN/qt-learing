#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //创建文本编辑器
    textEdit = new QTextEdit(this);
    setCentralWidget(textEdit);

    //创建菜单栏
    QMenuBar *menuBar = this->menuBar();

    //创建File菜单
    QMenu *fileMenu = menuBar->addMenu("File");

    //添加open动作
    QAction *openAction = new QAction("Open",this);
    connect(openAction,&QAction::triggered,this,&MainWindow::openFile);
    fileMenu->addAction(openAction);

    //添加save动作
    QAction *saveAction = new QAction("Save",this);
    connect(saveAction,&QAction::triggered,this,&MainWindow::saveFile);
    fileMenu->addAction(saveAction);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::openFile()
{
    QString filePath = QFileDialog::getOpenFileName(this,"Open File",QString(),"Text Files (*.txt);;All files(*)");

    if(!filePath.isEmpty()){
        //读取文件内容并显示在文本编辑器
        QFile file(filePath);
        if(file.open(QIODevice::ReadOnly|QIODevice::Text)){
            QTextStream in(&file);
            textEdit->setPlainText(in.readAll());
            file.close();
        }else{
            QMessageBox::warning(this,"Error","Could not open the file.");
        }
    }
}

void MainWindow::saveFile()
{
    QString filePath = QFileDialog::getSaveFileName(this,"Save File",QString(),"Text Files (*.txt);;All Files (*)");
    if(!filePath.isEmpty()){
        //将文本编辑器的内容保存到文件中
        QFile file(filePath);
        if(file.open(QIODevice::WriteOnly|QIODevice::Text)){
            QTextStream out(&file);
            out<<textEdit->toPlainText();
            file.close();
        } else {
            QMessageBox::warning(this,"Error","Could not save the file.");
        }
    }
}

