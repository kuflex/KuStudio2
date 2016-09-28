#include "Project.h"
#include <QtWidgets>


Project project;


//-------------------------------------------------------
Project::Project() {
    index_ = 0;

    module_add("Preview", "preview");
    module_add("Camera1", "Primesense-camera");
    module_add("Ortho", "ortho");
}

//-------------------------------------------------------
void Project::projectNew() {
    module_.clear();
    index_ = 0;
}

//-------------------------------------------------------
void Project::projectOpen(QString file_name) {

}

//-------------------------------------------------------
void Project::projectSave() {

}

//-------------------------------------------------------
void Project::projectSaveAs(QString file_name) {

}

//-------------------------------------------------------
QStringList Project::module_names() {
    QStringList list;
    for (size_t i=0; i<module_.size(); i++) {
        list.push_back(module_[i].name);
    }
    return list;
}

//-------------------------------------------------------
void Project::module_add(QString name, QString type) {
    module_.push_back(Module(name,type));
    cout<<name.toStdString()<<endl;
    cout<<type.toStdString()<<endl;
}

//-------------------------------------------------------
void Project::module_delete() {
    if (index_ >= 0 && index_ < module_.size()) {
        module_.erase(module_.begin()+index_);
    }
    else QMessageBox::information(0,"Warning", "You need to choose a module to delete");

}

//-------------------------------------------------------
void Project::module_select(int index) {
    if (index!=-1)
    index_=index;
    else QMessageBox::information(0,"Warning", "You need to choose a module");
}

//-------------------------------------------------------

