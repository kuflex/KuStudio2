#include "Module.h"
#include <QtWidgets>


//-------------------------------------------------------
//Модуль вызывает эту функцию в случае ошибки
void Module::error(QString message) {
    cout << "Module " << name.toStdString() << " error: " << message.toStdString() << endl;
}

//-------------------------------------------------------
//Возвращает true, если параметр можно менять в режиме работы
bool Module::get_unlock(QString param_name) {
    if ( param_name == "name" ) return false;
    if ( param_name == "type" ) return false;
    if ( param_name == "enabled" ) return true;
    if ( param_name == "thread" ) return false;
    return true;
}

//-------------------------------------------------------
QString Module::get_string(QString param_name) {
    if ( param_name == "name" ) {
        cout<<"name!! "<<name.toStdString()<<endl;
        return name;
    }
    if ( param_name == "type" ) {
        cout<<"! "<<type.toStdString()<<endl;
        return type;
    }
    error("no param " + param_name);
    return "";
}

//-------------------------------------------------------
QStringList Module::get_string_list(QString param_name) {
    if ( param_name== "threadList") {
        QStringList list;
        list.push_back("Main");
        list.push_back("2nd");
        list.push_back("3rd");
        list.push_back("4th");
        return list;
    }
    error("no param " + param_name);
    return QStringList();
}

//-------------------------------------------------------
float Module::get_float(QString param_name) {
    error("no param " + param_name);
    return 0;
}

//-------------------------------------------------------
int Module::get_int(QString param_name) {
    if ( param_name == "thread" ) return thread;
    error("no param " + param_name);
    return 0;
}

//-------------------------------------------------------
bool Module::get_bool(QString param_name) {
    if ( param_name == "enabled" ) return enabled;
    error("no param " + param_name);
    return 0;
}

//-------------------------------------------------------
void Module::set_string(QString param_name, QString value) {
    if ( param_name == "name" ) { name = value; return; }
    if ( param_name == "type" ) { type = value; return; }
    error("no param " + param_name);
}

//-------------------------------------------------------
void Module::set_string_list(QString param_name, QStringList value) {
    error("no param " + param_name);
}

//-------------------------------------------------------
void Module::set_float(QString param_name, float value) {
    error("no param " + param_name);
}

//-------------------------------------------------------
void Module::set_int(QString param_name, int value) {
    if ( param_name == "thread" ) { thread = value; return; }

    error("no param " + param_name);
}

//-------------------------------------------------------
void Module::set_bool(QString param_name, bool value) {
    if ( param_name == "enabled" ) { enabled = value; return; }
    error("no param " + param_name);
}

//-------------------------------------------------------

