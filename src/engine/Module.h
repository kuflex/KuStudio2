#pragma once


#include "kuMain.h"
#include<QStringList>


//Универсальный модуль
//Параметры:
//string        name
//string        type
//bool          enabled
//string_list   threadList - возвращает список потоков, READONLY
//int           thread   - текущий поток


struct Module {
    QString name;
    QString type;
    bool enabled;
    int thread;
    Module(QString name0, QString type0) {
        name = name0;
        type = type0;
        cout<<"!!!! "<<type.toStdString()<<endl;
        enabled = true;
    }
    virtual ~Module() {}

    //Возвращает true, если параметр можно менять в режиме работы
    virtual bool get_unlock(QString param_name);

    virtual QString get_string(QString param_name);
    virtual QStringList get_string_list(QString param_name);
    virtual float get_float(QString param_name);
    virtual int get_int(QString param_name);
    virtual bool get_bool(QString param_name);

    virtual void set_string(QString param_name, QString value);
    virtual void set_string_list(QString param_name, QStringList value);
    virtual void set_float(QString param_name, float value);
    virtual void set_int(QString param_name, int value);
    virtual void set_bool(QString param_name, bool value);


    //Модуль вызывает эту функцию в случае ошибки
    void error(QString message);
};

