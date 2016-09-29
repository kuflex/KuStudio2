#include "GuiBridge.h"
#include <QtWidgets>
#include "kuMain.h"

//Для подключения работы с модулями - нужен только engine.h
#include "engine.h"

//-------------------------------------------------------
GuiBridge::GuiBridge(){
    Inits();
}

//-------------------------------------------------------
void GuiBridge::Inits(){

    //Index=0;


}


//-------------------------------------------------------
QStringList GuiBridge::type_names(){
    return modules.modules_names();
    //Светлана, еще есть modules.modules_descriptions() - это список описаний всех модулей
}

//-------------------------------------------------------
QStringList GuiBridge::type_desc(){
    return modules.modules_descriptions();
}

//-------------------------------------------------------
int GuiBridge::type_count(){
    return modules.modules_names().size();
}

//-------------------------------------------------------
void GuiBridge::project_new(){
    project.projectNew();
}

//-------------------------------------------------------
QString GuiBridge::get_file_name(){
    return project.fileName();
}

//-------------------------------------------------------
void GuiBridge::project_open( QString fileName ){
    project.projectOpen(fileName);
}

//-------------------------------------------------------
void GuiBridge::project_save_as( QString fileName ){
    project.projectSaveAs(fileName);
}

//-------------------------------------------------------
bool GuiBridge::project_save(){
    return project.projectSave();
}

//-------------------------------------------------------
void GuiBridge::module_select(int index){
    cout << "SELECT" << endl;
    cout<<index<<endl;
    project.module_select(index);

    //Запрос информации о модуле
    QString name = module_get_string("name");
    QString type = module_get_string("type");
    QStringList threads = module_get_string_list("threadList");
    int thread = module_get_int("thread");
    cout << "Selected module " << name.toStdString()
         << ", " << type.toStdString()
         << ", thread " << threads[thread].toStdString() << endl;

    //если камера - то выводим список устройств
    if (type == "Primesense") {
        QStringList devices = module_get_string_list("deviceList");
        int device = module_get_int("device");
        cout << "      Device: " << devices[device].toStdString() << endl;

    }

}

//-------------------------------------------------------
bool GuiBridge::module_add(QString name, QString type){
    return project.module_add(name, type);
}

//-------------------------------------------------------
bool GuiBridge::module_delete(){
    return project.module_delete();
}

//-------------------------------------------------------
QStringList GuiBridge::module_names(){
    return project.module_names();
}

//-------------------------------------------------------
QStringList GuiBridge::module_prop_name(){
    return modules.modules_proposed_names();
}

//-------------------------------------------------------
int GuiBridge::module_count(){
    return project.module_names().size();
}

//-------------------------------------------------------
void GuiBridge::error( QString message ) {  //вызывать в случае ошибки
    QMessageBox::information(0,"Warning", "GuiBridge error: " + message);
}

//-------------------------------------------------------
bool GuiBridge::module_get_unlock(QString param_name) {
    if (project.module()) return project.module()->get_unlock(param_name);
    else return false;
}

//-------------------------------------------------------
QString GuiBridge::module_get_string(QString param_name) {
    if (project.module()) return project.module()->get_string(param_name);
    else return "";
}

//-------------------------------------------------------
QStringList GuiBridge::module_get_string_list(QString param_name) {
    if (project.module()) return project.module()->get_string_list(param_name);
    else return QStringList();
}

//-------------------------------------------------------
float GuiBridge::module_get_float(QString param_name) {
    if (project.module()) return project.module()->get_float(param_name);
    else return 0;
}

//-------------------------------------------------------
int GuiBridge::module_get_int(QString param_name) {
    if (project.module()) return project.module()->get_int(param_name);
    else return 0;
}

//-------------------------------------------------------
bool GuiBridge::module_get_bool(QString param_name) {
    if (project.module()) return project.module()->get_bool(param_name);
    else return false;
}

//-------------------------------------------------------
void GuiBridge::module_set_string(QString param_name, QString value) {
    if (project.module()) project.module()->set_string(param_name, value);
}

//-------------------------------------------------------
void GuiBridge::module_set_string_list(QString param_name, QStringList value) {
    if (project.module()) project.module()->set_string_list(param_name, value);
}

//-------------------------------------------------------
void GuiBridge::module_set_float(QString param_name, float value) {
    if (project.module()) project.module()->set_float(param_name, value);
}

//-------------------------------------------------------
void GuiBridge::module_set_int(QString param_name, int value) {
    if (project.module()) project.module()->set_int(param_name, value);
}

//-------------------------------------------------------
void GuiBridge::module_set_bool(QString param_name, bool value) {
    if (project.module()) project.module()->set_bool(param_name, value);
}
//-------------------------------------------------------



