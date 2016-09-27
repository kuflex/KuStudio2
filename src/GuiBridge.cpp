#include "GuiBridge.h"
#include <QtWidgets>

GuiBridge::GuiBridge(){
    Inits();
}
QStringList GuiBridge::type_names(){
    return ListType;
}

int GuiBridge::type_count(){
    return CountType;
}

void GuiBridge::project_open( QString fileName ){
    cout<<fileName.toStdString()<<endl;
}
void GuiBridge::project_save_as( QString fileName ){
    cout<<fileName.toStdString()<<endl;
}

void GuiBridge::module_select(int index){
    if (index!=-1)
    Index=index;
    else QMessageBox::information(0,"Warning", "Выберите модуль для работы!");
}

void GuiBridge::module_add(QString name, QString type){
    ModuleNames.push_back(name);
    cout<<name.toStdString()<<endl;
    cout<<type.toStdString()<<endl;
}
void GuiBridge::module_delete(){
    ModuleNames.erase(ModuleNames.begin()+Index);
}

QStringList GuiBridge::module_names(){
    return ModuleNames;
}
int GuiBridge::module_count(){
    CountModule=ModuleNames.size();
    return CountModule;
}

void GuiBridge::Inits(){

    //Index=0;

    ListType.push_back("preview");
    ListType.push_back("camera");
    ListType.push_back("pointCloud");
    ListType.push_back("ortho");
    ListType.push_back("optFlow");
    ListType.push_back("sender");

    CountType=ListType.size();

    ModuleNames.push_back("Preview");
    ModuleNames.push_back("Camera1");
    ModuleNames.push_back("Ortho");
}



