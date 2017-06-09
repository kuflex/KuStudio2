import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1


TabView {
    id:view_w
    style:tabStyle
    property string param_name:"primesense"
    //property var prop:params_fill()


    DataResol{
        id:dataResol
    }
    DataThread{
        id:dataThread
    }

   ListModel{ // DataDevice
        id:dataDevice
    }

    Component.onCompleted: {
       //params_fill();
    }


    Tab {
        id:tab
        title: "Parameters"

        property string compFieldType:""
        property string nameFieldType:"type"

        property string compFieldName:""
        property string nameFieldName:"name"

        property bool compChEnabled
        property string nameChEnabled:"enabled"

        property string nameView:"deviceList"
        property string nameResol:"resolutionList"
        property string nameThread:"threadList"

        property bool compDepth
        property string nameDepth:"out_depth"

        property bool compRgb
        property string nameRgb:"out_image"

        property bool compXyz
        property string nameXyz:"out_XYZ"

        property bool compXyzRgb
        property string nameXyzRgb:"out_XYZ_RGB"

        property bool compLabels
        property string nameLabels:"out_labels"

        property bool compSkeleton
        property string nameSkeleton:"out_skeleton"



              Item{
                  id:item
                   anchors.fill:parent
                   anchors.margins: 5

                    TextLine{
                        id:typeTx
                        anchors.top: parent.top
                        text: "Type:"
                    }
                    TextFields{
                        id:fieldType
                        anchors.topMargin: 3
                        anchors.top: typeTx.bottom
                        text:tab.compFieldType
                        property string name: "type";
                        readOnly: true
                    }


                    TextLine{
                        id:nameTx
                        anchors.topMargin: 7
                        anchors.bottomMargin: 3
                        anchors.top: fieldType.bottom
                        text: "Name:"
                    }
                    TextFields{
                        id:fieldName
                        anchors.topMargin: 3
                        anchors.bottomMargin: 7
                        anchors.top: nameTx.bottom
                        text: tab.compFieldName
                        property string name: "name";
                        onEditingFinished: {
                            bridge.module_set_string(name, text);
                        }
                    }

                    CheckBoxes {
                        id:chEnabled
                        anchors.topMargin: 7
                        anchors.bottomMargin: 7
                        anchors.top: fieldName.bottom
                        text: qsTr("Enabled")
                        checked:tab.compChEnabled
                        property string name: "enabled"
//                        onCheckedChanged: {
//                           bridge.module_set_bool(name, checked);
//                        }
                        onClicked: {
                           bridge.module_set_bool(name, checked);
//                            mes.text=checked;
//                            mes.open();
                        }
                    }


                    TextLine{
                        id:deviceTx
                        anchors.topMargin: 7
                        anchors.bottomMargin: 3
                        anchors.top: chEnabled.bottom
                        text: "Devices:"
                    }
                    TableView {
                        id:view
                        anchors.topMargin: 3
                        anchors.bottomMargin: 7
                        anchors.top: deviceTx.bottom
                        property string type: "model"
                        width:tab.width-20
                        height:120
                        model: dataDevice
                        headerVisible: false
                        backgroundVisible:false
                        alternatingRowColors:false
                        focus: true
                        TableViewColumn {
                                role: "name"
                                width: parent.width
                            }
                        onClicked: {
//                            mes.text=view.currentRow;
//                            mes.open();
                        }
                        property string name: "deviceList"
                    }


                    TextLine{
                        id:resTx
                        anchors.topMargin: 7
                        anchors.bottomMargin: 3
                        anchors.top: view.bottom
                        text: "Res/FPS:"
                    }
                    ComboBox {
                        id:resol
                        anchors.topMargin: 3
                        anchors.bottomMargin: 7
                        anchors.top: resTx.bottom
                        width: tab.width-20
                        textRole: "name"
                        //model: [ "640x480,  30 FPS", "320x240,  60 FPS" ]
                        model:dataResol
                        property string name:"resolution"
                        property string type: "model"
                        onCurrentIndexChanged:{
                            bridge.module_set_int(name, currentIndex);
                            //mes.text=currentIndex;
                            //mes.open();
                        }

                    }


                    TextLine{
                        id:threadTx
                        anchors.topMargin: 7
                        anchors.bottomMargin: 3
                        anchors.top: resol.bottom
                        text: "Thread"
                    }
                    ComboBox {
                        id:thread
                        anchors.topMargin: 3
                        anchors.bottomMargin: 7
                        anchors.top: threadTx.bottom
                        width: tab.width-20
                        textRole: "name"
                        //model: [ "Main", "2nd", "3rd", "4th", "5th" ]
                        model:dataThread
                        property string type: "model"
                        property string name: "threadList"
                    }


                    TextLine{
                        id:outputTx
                        anchors.topMargin: 7
                        anchors.bottomMargin: 3
                        anchors.top: thread.bottom
                        text: "Outputs: "
                    }
                    CheckBoxes {
                        id:depth
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: outputTx.bottom
                        text: qsTr("Depth")
                        checked: tab.compDepth
                        property string name:"out_depth"
                    }
                    CheckBoxes {
                        id:rgb
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: depth.bottom
                        text: qsTr("RGB")
                        checked: tab.compRgb
                        property string name:"out_image"
                    }
                    CheckBoxes {
                        id:xyz
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: rgb.bottom
                        text: qsTr("XYZ")
                        checked: tab.compXyz
                        property string name:"out_XYZ"
                    }
                    CheckBoxes {
                        id:xyzRgb
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: xyz.bottom
                        text: qsTr("XYZ+RGB")
                        checked: tab.compXyzRgb
                        property string name:"out_XYZ_RGB"
                    }
                    CheckBoxes {
                        id:labels
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: xyzRgb.bottom
                        text: qsTr("Labels")
                        checked: tab.compLabels
                        property string name:"out_labels"
                    }
                    CheckBoxes {
                        id:skeleton
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: labels.bottom
                        text: qsTr("Skeleton")
                        checked: tab.compSkeleton
                        property string name:"out_skeleton"
                    }

               }

    }



    function params_fill(){


            tab.compFieldType=bridge.module_get_string(tab.nameFieldType);
            tab.compFieldName=bridge.module_get_string(tab.nameFieldName);
        //mes.text="helllllloooooooooo";
        //mes.open();
            tab.compChEnabled=bridge.module_get_bool(tab.nameChEnabled);

            tab.compDepth=bridge.module_get_bool(tab.nameDepth);
            tab.compRgb=bridge.module_get_bool(tab.nameRgb);
            tab.compXyz=bridge.module_get_bool(tab.nameXyz);
            tab.compXyzRgb=bridge.module_get_bool(tab.nameXyzRgb);
            tab.compLabels=bridge.module_get_bool(tab.nameLabels);
            tab.compSkeleton=bridge.module_get_bool(tab.nameSkeleton);

            fill_device_list();
            fill_thread_list();
            fill_resol_list();



      /* var len1=column.children.length;
        var len2=0;
//                mes.text=column.children[1].children[1].text;
        //mes.open();
        for (var i = 0; i < len1; ++i){
            var out=column.children[i].children;
            len2=out.length;
            if(len2!==0){
                for (var j=1; j<len2; ++j){
                   var inside=out[j];
                    get_params(inside.type, inside.name) ;

                }
            }
        }*/


//                mes.text=column.children[0].type;
        //column.children[2]
        //mes.text=column.children.lenght;
        //mes.text=/*typeof(*/column.children[1].children[0].text/*)*/; //.objectName
//                mes.open();
    }

function get_params(type, name){

}

function fill_device_list(){
    dataDevice.clear();
    var devices=bridge.module_get_string_list(tab.nameView);
    for(var i=0; i<devices.length; i++){
       dataDevice.append({"name":devices[i]});
    }
}

function fill_thread_list(){
    dataThread.clear();
    var threads=bridge.module_get_string_list(tab.nameThread);
    for(var i=0; i<threads.length; i++){
       dataThread.append({"name":threads[i]});
    }
}
function fill_resol_list(){
    dataResol.clear();
    var resolutions=bridge.module_get_string_list(tab.nameResol);
    for(var i=0; i<resolutions.length; i++){
       dataResol.append({"name":resolutions[i]});
    }
}

}


