#pragma once


#include "kuMain.h"
#include<QStringList>


//Модуль
struct Module {
    QString name;
    QString type;
    bool enabled;
    Module(QString name0, QString type0) {
        name = name0;
        type = type0;
        enabled = true;
    }
};


//Проект
struct Project {
    Project();

    void projectNew();
    void projectOpen(QString file_name);
    void projectSave();
    void projectSaveAs(QString file_name);

    QStringList module_names();
    void module_add(QString name, QString type);
    void module_delete();
    void module_select(int index);



protected:
    QString file_name_;
    vector<Module> module_;

    int index_;         //выбранный модуль
};

extern Project project;
