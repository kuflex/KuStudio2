#pragma once


#include "kuMain.h"
#include<QStringList>
#include "Module.h"


//Модуль Primesense
//Параметры:
//string        name
//string        type
//bool          enabled
//string_list   threadList - возвращает список потоков, READONLY
//int           thread   - текущий поток

//string_list   deviceList - возвращает список устройств, READONLY
//int           device   - текущее разрешение/FPS
//string_list   resolutionList - возвращает список разрешений/FPS, READONLY
//int resolution   - текущее разрешение/FPS

//bool out_depth   - выдавать глубину
//bool out_image   - выдавать изображение
//bool out_XYZ      - выдавать точки
//bool out_XYZ_RGB      - выдавать точки
//bool out_labels
//bool out_skeleton


struct ModulePrimesense : public Module {
    ModulePrimesense(QString name0);
    virtual ~ModulePrimesense() {}

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


protected:
    int device;
    int resolution;

    bool out_depth;
    bool out_image;
    bool out_XYZ;
    bool out_XYZ_RGB;
    bool out_labels;
    bool out_skeleton;


};
