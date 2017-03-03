#include "ModulePrimesense.h"
#include <QtWidgets>


//-------------------------------------------------------
ModulePrimesense::ModulePrimesense(QString name0):
    Module(name0, "Primesense") {
    device = 0;
    resolution = 0;

    out_depth   = true;
    out_image   = true;
    out_XYZ     = true;
    out_XYZ_RGB = true;
    out_labels  = true;
    out_skeleton    = true;

    cout << "    Creating Primesense..." << endl;
    QStringList devices = get_string_list("deviceList");
    for (int i=0; i<devices.size(); i++) {
        cout << "\t" << devices[i].toStdString() << endl;
    }
}

//-------------------------------------------------------
//Возвращает true, если параметр можно менять в режиме работы
bool ModulePrimesense::get_unlock(QString param_name) {
//    if ( param_name == "name" ) return false;
    return Module::get_unlock(param_name);
}

//-------------------------------------------------------
QString ModulePrimesense::get_string(QString param_name) {
    //if ( param_name == "name" ) return name;
    return Module::get_string(param_name);
}

//-------------------------------------------------------
QStringList ModulePrimesense::get_string_list(QString param_name) {
    if ( param_name == "deviceList") {
        QStringList list;
        list.push_back("Primesense1 -");
        list.push_back("Primesense2 -");
        list.push_back("Primesense3 -");
        list.push_back("Primesense4 -");
        return list;
    }
    if ( param_name == "resolutionList") {
        QStringList list;
        list.push_back("640x480, 30 fps");
        list.push_back("320x240, 60 fps");
        return list;
    }
    return Module::get_string_list(param_name);
}

//-------------------------------------------------------
float ModulePrimesense::get_float(QString param_name) {
    error("no param " + param_name);
    return 0;
}

//-------------------------------------------------------
int ModulePrimesense::get_int(QString param_name) {
    error("no param " + param_name);
    return 0;
}

//-------------------------------------------------------
bool ModulePrimesense::get_bool(QString param_name) {
    if ( param_name == "enabled" ) return enabled;

    if ( param_name == "out_depth" ) return out_depth;
    if ( param_name == "out_image" ) return out_image;
    if ( param_name == "out_XYZ" ) return out_XYZ;
    if ( param_name == "out_XYZ_RGB" ) return out_XYZ_RGB;
    if ( param_name == "out_labels" ) return out_labels;
    if ( param_name == "out_skeleton" ) return out_skeleton;
    error("no param " + param_name);
    return 0;
}

//-------------------------------------------------------
void ModulePrimesense::set_string(QString param_name, QString value) {
    if ( param_name == "name" ) { name = value; return; }
    if ( param_name == "type" ) { type = value; return; }
    error("no param " + param_name);
}

//-------------------------------------------------------
void ModulePrimesense::set_string_list(QString param_name, QStringList value) {
    error("no param " + param_name);
}

//-------------------------------------------------------
void ModulePrimesense::set_float(QString param_name, float value) {
    error("no param " + param_name);
}

//-------------------------------------------------------
void ModulePrimesense::set_int(QString param_name, int value) {
    error("no param " + param_name);
}

//-------------------------------------------------------
void ModulePrimesense::set_bool(QString param_name, bool value) {
    if ( param_name == "enabled" ) { enabled = value; return; }
    error("no param " + param_name);
}

//-------------------------------------------------------

