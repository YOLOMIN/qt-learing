#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QCheckBox>
#include <QRadioButton>
#include <QVBoxLayout>
#include <QLabel>
#include <QWidget>
#include <QButtonGroup>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
private slots:
    void handleCheckBoxStateChanged(int state);
    void handleRadioButtonToggled(bool checked);
private:
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
