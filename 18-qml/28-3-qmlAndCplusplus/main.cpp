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
    qmlRegisterType<Mixing>("an.qt.Mixing", 1, 0, "Mixing");

    //QQmlApplicationEngine engine;
    //engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    //if (engine.rootObjects().isEmpty())
    //    return -1;
    QQmlEngine engine;
    //在C++中访问Qml中的属性
    QQmlComponent compontext(&engine, QUrl(QStringLiteral("qrc:///main.qml")));
    QObject *object = compontext.create();
    qDebug() << "width value is" << object->property("width").toInt();
    object->setProperty("width", 320);
    qDebug() << "height value is" << QQmlProperty::read(object, "height").toInt();
    QQmlProperty::write(object, "height", 240);
    QObject *rect = object->findChild<QObject*>("rect");
    if(rect) {
        rect->setProperty("color", "orange");
    }
    //在C++中访问Qml中的函数与信号
    QVariant returnedValue;
    QVariant message = "Hello from c++";
    QMetaObject::invokeMethod(object,"qmlFunction",
                              Q_RETURN_ARG(QVariant,returnedValue),
                              Q_ARG(QVariant,message));
    qInfo() << "returnedValue is " << returnedValue.toString();
    Mixing mixing;
    QObject::connect(object, SIGNAL(qmlSignal(QString)),
                         &mixing, SLOT(cppSlot(QString)));
    return app.exec();
}
