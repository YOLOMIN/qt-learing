#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "childwindow.h"
#include <QMdiArea>
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
private:
    void createMenuBar();
    void createToolBar();
    void createStatusBar();
    void createChildWindow(const QString &title);
    void creatDockWindow(const QString &title);

private slots:
    void newFile();
    void updateSTatusBar(const QString &title);

private:
    Ui::MainWindow *ui;
    QTextEdit *textEdit;
    QMdiArea mdiArea;
    QLabel *statusBarLabel;
};
#endif // MAINWINDOW_H
