#pragma once

#include<QStringList>
#include "kuMain.h"
#include "Module.h"

//Проект
struct Project {
    Project();

    void projectNew();
    void projectOpen(QString file_name);
    bool projectSave();
    void projectSaveAs(QString file_name);

    QStringList module_names();
    bool module_add(QString name, QString type);
    bool module_delete();
    void module_select(int index);

    QString fileName() { return file_name_; }

    bool indexValid();  //возвращает true, если выбранный индекс правильный, от 0 до module_.size()-1
    Module *module();   //возвращает текущий модуль, или 0 если нет модуля

protected:
    QString file_name_;
    vector<Module *> module_;

    int index_;         //выбранный модуль
};

extern Project project;
