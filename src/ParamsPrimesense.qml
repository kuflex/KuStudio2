import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

TabView {
    id:view_w
    style:tabStyle
    property string param_name:"primesense"

    ListModel{
        id:dataThread
    }
    ListModel{
        id:dataResol
    }


    Tab {


        id:tab
        title: "Parameters"
        Column{

            Component.onCompleted: {
               params_fill();
            }
            id:column
            anchors.fill:parent
            anchors.margins: 10
            spacing: 10
            //TextLine{text: "Type:"+"PrimeSenseCamera"}
            Column{
                spacing:3
                TextLine{text: "Type:"}
                TextFields{
                    id:fieldType
                    //text: "PrimeSenseCamera"
                    text:""
                    property string name: "type";
                }
            }
            Column{
                spacing:3
                TextLine{text: "Name:"}
                TextFields{
                    id:fieldName
                    text: ""
                    property string name: "name";
                }
            }
            CheckBoxes {
                id:chEnabled
                text: qsTr("Enabled")
                //checked: true
                property string name: "enabled"
            }
            Column{
                spacing:3
                TextLine{text: "Devices:"}
                TableView {
                    id:view
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
            }
            Column{
                spacing:3
                TextLine{text: "Res/FPS:"}
                ComboBox {
                    id:resol
                    width: tab.width-20
                    //model: [ "640x480,  30 FPS", "320x240,  60 FPS" ]
                    model:dataResol
                    property string name:"resolutionList"
                    property string type: "model"
                }
            }
            Column{
                spacing:3
                TextLine{text: "Thread"}
                ComboBox {
                    id:thread
                    width: tab.width-20
                    //model: [ "Main", "2nd", "3rd", "4th", "5th" ]
                    model:dataThread
                    property string type: "model"
                    property string name: "threadList"
                }
            }
            Column{
                spacing:3
                TextLine{text: "Outputs: "}
                CheckBoxes {
                    text: qsTr("Depth")
                    checked: true
                    property string name:"out_depth"
                }
                CheckBoxes {
                    text: qsTr("RGB")
                    checked: true
                    property string name:"out_depth"
                }
                CheckBoxes {
                    text: qsTr("XYZ")
                    checked: false
                    property string name:"out_XYZ"
                }
                CheckBoxes {
                    text: qsTr("XYZ+RGB")
                    checked: false
                    property string name:"out_XYZ_RGB"
                }
                CheckBoxes {
                    text: qsTr("Labels")
                    checked: false
                    property string name:"out_labels"
                }
                CheckBoxes {
                    text: qsTr("Skeleton")
                    checked: false
                    property string name:"out_skeleton"
                }

            }
            function params_fill(){
                    fieldType.text=bridge.module_get_string(fieldType.name);
                    fieldName.text=bridge.module_get_string(fieldName.name);
                    chEnabled.checked=bridge.module_get_bool(chEnabled.name);
                    fill_device_list();
                    fill_thread_list();
                    fill_resol_list();


                //var len = view_w.getTab()/*.item.children[0].length*/;
                //mes.text=tab.children.length;
                //mes.text=view_w.getTab(0).item.children[0].name;
//                mes.text=column.children[0].children.length;
                var len1=column.children.length;
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
                }


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


    }


}


