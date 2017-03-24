#include "Project.h"
#include <QtWidgets>
#include "Modules.h"


Project project;

//-------------------------------------------------------
Project::Project() {
    index_ = 0;

    module_add("Preview", "preview");
    module_add("Camera1", "Primesense");
    module_add("Ortho", "ortho");
}

//-------------------------------------------------------
void Project::projectNew() {
    module_.clear();
    index_ = -1;
    file_name_ = "";
}

//-------------------------------------------------------
void Project::projectOpen(QString file_name) {
    cout<<file_name.toStdString()<<endl;
    file_name_ = file_name;
}

//-------------------------------------------------------
bool Project::projectSave() {
    if (file_name_ == "" ) return false;
    return true;
}

//-------------------------------------------------------
void Project::projectSaveAs(QString file_name) {
    cout<<file_name.toStdString()<<endl;
    file_name_ = file_name;
}

//-------------------------------------------------------
void Project::module_select(int index) {
    cout<<index<<endl;
    if(index!=-1){
    index_=index;
    cout<<index_<<endl;
    }
    else QMessageBox::information(0,"Warning", "You need to choose a module");
}

//-------------------------------------------------------
bool Project::indexValid() {  //возвращает true, если выбранный индекс правильный, от 0 до module_.size()-1
    return (index_ >= 0 && index_ < module_.size());
}

//-------------------------------------------------------
Module *Project::module() {   //возвращает текущий модуль, или 0 если нет модуля
    return (indexValid())?module_[index_]:0;
}


//-------------------------------------------------------
QStringList Project::module_names() {
    QStringList list;
    for (size_t i=0; i<module_.size(); i++) {
        list.push_back(module_[i]->name);
    }
    return list;
}

//-------------------------------------------------------
bool Project::module_add(QString name, QString type) {
    if (name == "") {
        QMessageBox::information(0,"Warning", "Please, enter module name");
        return false;
    }
    for (size_t i=0; i<module_.size(); i++) {
        if (module_[i]->name == name) {
            QMessageBox::information(0,"Warning", "Module " + name + " already exists. Type another name.");
            return false;
        }
    }

    Module *module = modules.createModule(name,type);
    module_.push_back(module);
    cout<<"Created module " << module->name.toStdString()<< ", "<<module->type.toStdString()<<endl;
    return true;
}

//-------------------------------------------------------
bool Project::module_delete() {
    if (indexValid()) {
        delete module();
        module_.erase(module_.begin()+index_);
        return true;
    }
    else {
        QMessageBox::information(0,"Warning", "You need to choose a module to delete");
        return false;
    }


}

//-------------------------------------------------------
int Project::getIndex(){
    return index_;
}

//-------------------------------------------------------
void Project::setIndex(int index){
    index_=index;

}

//-------------------------------------------------------

