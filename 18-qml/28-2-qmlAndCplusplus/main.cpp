#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "mixing.h"
#include <QQuickView>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQuickView view;
    Mixing mixing;
//    view.rootContext()->setContextProperty("Data", QString("设置Qml上下文属性"));
    view.rootContext()->setContextProperty("mixing", &mixing);

    view.setSource(QUrl(QStringLiteral("qrc:///main.qml")));
    view.show();

    return app.exec();
}
