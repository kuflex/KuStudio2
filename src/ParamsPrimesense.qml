import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

TabView {
    id:view_w
    style:tabStyle
    property string param_name:"primesense"
    property var prop:params_fill()


    DataResol{
        id:dataResol
    }
    DataThread{
        id:dataThread
    }

    DataDevice{
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
                        //property string name: "type";
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
                    }

                    CheckBoxes {
                        id:chEnabled
                        anchors.topMargin: 7
                        anchors.bottomMargin: 7
                        anchors.top: fieldName.bottom
                        text: qsTr("Enabled")
                        //checked: true
                        property string name: "enabled"
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
                        //anchors.margins: 3
                        //anchors.fill: parent
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
                        onClicked: { //onActivated
                            //bridge.module_select(view.currentRow);
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
                        property string name:"resolutionList"
                        property string type: "model"
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
                        //checked: true
                        property string name:"out_depth"
                    }
                    CheckBoxes {
                        id:rgb
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: depth.bottom
                        text: qsTr("RGB")
                        //checked: true
                        property string name:"out_image"
                    }
                    CheckBoxes {
                        id:xyz
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: rgb.bottom
                        text: qsTr("XYZ")
                        //checked: false
                        property string name:"out_XYZ"
                    }
                    CheckBoxes {
                        id:xyzRgb
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: xyz.bottom
                        text: qsTr("XYZ+RGB")
                        //checked: false
                        property string name:"out_XYZ_RGB"
                    }
                    CheckBoxes {
                        id:labels
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: xyzRgb.bottom
                        text: qsTr("Labels")
                        //checked: false
                        property string name:"out_labels"
                    }
                    CheckBoxes {
                        id:skeleton
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.top: labels.bottom
                        text: qsTr("Skeleton")
                        //checked: false
                        property string name:"out_skeleton"
                    }

               }

    }



    function params_fill(){

        //depth.checked=true;




            tab.compFieldType=bridge.module_get_string(tab.nameFieldType); //fieldType

        //mes.text=tab.compFieldType;
        //mes.open();

            tab.compFieldName=bridge.module_get_string(tab.nameFieldName);
            //chEnabled.checked=bridge.module_get_bool(chEnabled.name);

        //depth.checked=bridge.module_get_bool(depth.name);
        //rgb.checked=bridge.module_get_bool(rgb.name);
        //xyz.checked=bridge.module_get_bool(xyz.name);
        //xyzRgb.checked=bridge.module_get_bool(xyzRgb.name);
        //labels.checked=bridge.module_get_bool(labels.name);
        //skeleton.checked=bridge.module_get_bool(skeleton.name);

            //fill_device_list();
            //fill_thread_list();
            //fill_resol_list();


        //var flag=bridge.module_get_bool(rgb.name);
        //mes.text=flag;
        //mes.open();


        //var len = view_w.getTab()/*.item.children[0].length*/;
        //mes.text=tab.children.length;
        //mes.text=view_w.getTab(0).item.children[0].name;
//                mes.text=column.children[0].children.length;



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
    var devices=bridge.module_get_string_list(view.name);
    for(var i=0; i<devices.length; i++){
       dataDevice.append({"name":devices[i]});
    }
}

function fill_thread_list(){
    dataThread.clear();
    var threads=bridge.module_get_string_list(thread.name);
    for(var i=0; i<threads.length; i++){
       dataThread.append({"name":threads[i]});
    }
}
function fill_resol_list(){
    dataResol.clear();
    var resolutions=bridge.module_get_string_list(resol.name);
    for(var i=0; i<resolutions.length; i++){
       dataResol.append({"name":resolutions[i]});
    }
}

}


