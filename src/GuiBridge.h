#pragma once

#include <iostream>
using namespace std;

#include<QStringList>

class GuiBridge : public QObject{
    Q_OBJECT
public:
    GuiBridge();

    Q_INVOKABLE void project_new();
    //Q_INVOKABLE void project_open_last();                //открыть последний проект
    Q_INVOKABLE void project_open( QString fileName );   //ku2
    Q_INVOKABLE void project_save_as( QString fileName );
    Q_INVOKABLE bool project_save();

    Q_INVOKABLE QString get_file_name();
    Q_INVOKABLE QString get_module_type();


    Q_INVOKABLE QStringList type_names();
    Q_INVOKABLE QStringList type_desc();

    Q_INVOKABLE int type_count();

    Q_INVOKABLE QStringList module_names();
    Q_INVOKABLE QStringList module_prop_name();
    Q_INVOKABLE int module_count();

    Q_INVOKABLE bool module_add(QString name, QString type);
    Q_INVOKABLE bool module_delete();

    Q_INVOKABLE void module_select(int index);


    //Возвращает true, если параметр можно менять в режиме работы
    Q_INVOKABLE bool module_get_unlock(QString param_name);

    //Получение и установка параметров о настройках модуля

    Q_INVOKABLE QString module_get_string(QString param_name);
    Q_INVOKABLE QStringList module_get_string_list(QString param_name);
    Q_INVOKABLE float module_get_float(QString param_name);
    Q_INVOKABLE int module_get_int(QString param_name);
    Q_INVOKABLE bool module_get_bool(QString parame_name);

    Q_INVOKABLE void module_set_string(QString param_name, QString value);
    Q_INVOKABLE void module_set_string_list(QString param_name, QStringList value);
    Q_INVOKABLE void module_set_float(QString param_name, float value);
    Q_INVOKABLE void module_set_int(QString param_name, int value);
    Q_INVOKABLE void module_set_bool(QString param_name, bool value);



//--------------------------------------

private:
    void Inits();

    void error( QString message );  //вызывать в случае ошибки
    QString module_type;

};
