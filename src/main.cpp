#include <QApplication>
#include <QQmlApplicationEngine>

#include "GuiBridge.h"
#include<QtQml>

#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    //MyWidget my;
    qmlRegisterType<GuiBridge>("com.kuflex.GuiBridge", 1, 0, "GuiBridge");


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
