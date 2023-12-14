#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <work.h>
#include <QPushButton>
#include <QMessageBox>
#include <QThread>
#include <QLayout>
#include <QHBoxLayout>
#include <QLabel>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
private Q_SLOTS:
    void startTask();
    void countText(int id);
private:
    Ui::MainWindow *ui;
    QLabel* countLabel;
};
#endif // MAINWINDOW_H
