#include "GuiBridge.h"
#include <QtWidgets>
#include "kuMain.h"

//Для подключения работы с модулями - нужен только engine.h
#include "engine.h"


GuiBridge::GuiBridge(){
    Inits();
}

QStringList GuiBridge::type_names(){
    return modules.modules_names();
    //Светлана, еще есть modules.modules_descriptions() - это список описаний всех модулей
}

QStringList GuiBridge::type_desc(){
    return modules.modules_descriptions();
}

int GuiBridge::type_count(){
    return modules.modules_names().size();
}

void GuiBridge::project_new(){
    project.projectNew();
}

QString GuiBridge::get_file_name(){
    return project.fileName();
}

void GuiBridge::project_open( QString fileName ){
    project.projectOpen(fileName);
}

void GuiBridge::project_save_as( QString fileName ){
    project.projectSaveAs(fileName);
}

bool GuiBridge::project_save(){
    return project.projectSave();
}

void GuiBridge::module_select(int index){
    project.module_select(index);
}

bool GuiBridge::module_add(QString name, QString type){
    project.module_add(name, type);
}
void GuiBridge::module_delete(){
    project.module_delete();
}

QStringList GuiBridge::module_names(){
    return project.module_names();
}

QStringList GuiBridge::module_prop_name(){
    return modules.modules_proposed_names();
}

int GuiBridge::module_count(){
    return project.module_names().size();
}

void GuiBridge::Inits(){

    //Index=0;


}



