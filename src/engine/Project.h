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
    bool projectSave();
    void projectSaveAs(QString file_name);

    QStringList module_names();
    bool module_add(QString name, QString type);
    void module_delete();
    void module_select(int index);

    QString fileName() { return file_name_; }


protected:
    QString file_name_;
    vector<Module> module_;

    int index_;         //выбранный модуль
};

extern Project project;
