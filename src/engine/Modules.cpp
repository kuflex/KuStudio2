#include "Modules.h"
#include "ModulePrimesense.h"

Modules modules;

//-------------------------------------------------------
Modules::Modules() {

    reg_module("VideoPlayer", "Play video files", "Video");

    reg_module("Primesense", "Capture data from Primesense depth camera", "Primesense");
    reg_module("Preview", "Preview module", "Preview");
    reg_module("PointCloud", "Processing point clouds", "PointCloud");
    reg_module("Ortho",  "Processing 2D projection of a point cloud", "Ortho");
    reg_module("OptFlow", "Computing optical flow", "Flow");
    reg_module("SenderOSC", "Sending OSC data by network", "SenderOSC");
}

//-------------------------------------------------------
void Modules::reg_module(QString type0, QString descr0, QString proposed_name0) {
    reg_modules_.push_back( ModuleInfo(type0, descr0, proposed_name0) );
}

//-------------------------------------------------------
QStringList Modules::modules_names() {          //Имена доступных модулей
    QStringList list;
    for (size_t i=0; i<reg_modules_.size(); i++) {
        list.push_back(reg_modules_[i].type_name);
    }

    return list;
}

//-------------------------------------------------------
QStringList Modules::modules_descriptions() {    //Описания доступных модулей
    QStringList list;
    for (size_t i=0; i<reg_modules_.size(); i++) {
        list.push_back(reg_modules_[i].description);
    }

    return list;
}

//-------------------------------------------------------
QStringList Modules::modules_proposed_names() {    //Предлагаемые названия для объектов модулей
    QStringList list;
    for (size_t i=0; i<reg_modules_.size(); i++) {
        list.push_back(reg_modules_[i].proposed_name);
    }

    return list;

}

//-------------------------------------------------------
Module *Modules::createModule( QString name, QString type ) {
    if ( type == "Primesense" ) return new ModulePrimesense(name);
    return new Module(name,type);
}

//-------------------------------------------------------
