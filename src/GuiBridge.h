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


    Q_INVOKABLE QStringList type_names();

    Q_INVOKABLE int type_count();

    Q_INVOKABLE QStringList module_names();
    Q_INVOKABLE int module_count();

    Q_INVOKABLE bool module_add(QString name, QString type);
    Q_INVOKABLE void module_delete();

    Q_INVOKABLE void module_select(int index);

    //Q_INVOKABLE QString get_module_string(QString param_name) { return "A"; }
    //Q_INVOKABLE float get_module_float(QString param_name) { return 1.0; }
    //Q_INVOKABLE float get_module_int(QString param_name) { return 1; }
     //Q_INVOKABLE ??? get_module_bool(QString parame_name) { return 1; }

    //Q_INVOKABLE QString set_module_string(QString param_name, QString value) {}
    //Q_INVOKABLE QString set_module_float(QString param_name, float value) {}
    //Q_INVOKABLE QString set_module_int(QString param_name, int value) {}


//--------------------------------------

private:
    void Inits();
};
