#ifndef CHILDWINDOW_H
#define CHILDWINDOW_H

#include <QObject>
#include <QMenu>
#include <QMenuBar>
#include <QToolBar>
#include <QStatusBar>
#include <QDockWidget>
#include <QTextEdit>

class ChildWindow : public QTextEdit
{
    Q_OBJECT
public:
    ChildWindow(QWidget *parent = nullptr):QTextEdit(parent){};
};

#endif // CHILDWINDOW_H
