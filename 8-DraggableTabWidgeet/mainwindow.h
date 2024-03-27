#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTabWidget>
#include <QVBoxLayout>
#include <QPushButton>
#include <QDebug>
#include <QTimer>
#include <draggabletabwidgeet.h>

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
    void handleTabChaanged(int index);
    void autoScrollTab();
private:
    Ui::MainWindow *ui;
    DraggableTabWidgeet *tabWidget;
    QPoint strtPos;
    bool isDragging;
    int dragThreshold = 30;

};
#endif // MAINWINDOW_H
