import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

TabView {
    id:view_w
    style:tabStyle
    property string param_name:"primesense"


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
                    //text: "PrimeSenseCamera"
                    text: bridge.module_get_string("type")
                    property string name: "type";
                }
            }
            Column{
                spacing:3
                TextLine{text: "Name:"}
                TextFields{
                    text: bridge.module_get_string("name");
                    property string name: "name";
                }
            }
            CheckBoxes {
                id:ch
                text: qsTr("Enabled")
                checked: true
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
                    model: dataName
                    headerVisible: false
                    backgroundVisible:false
                    alternatingRowColors:false
                    focus: true
                    TableViewColumn {
                            role: "name"
                            width: parent.width
                        }
                    onClicked: { //onActivated
                        bridge.module_select(view.currentRow);
                    }
                }
            }
            Column{
                spacing:3
                TextLine{text: "Res/FPS:"}
                ComboBox {
                    width: tab.width-20
                    model: [ "640x480,  30 FPS", "320x240,  60 FPS" ]
                    //property string name:"resolutionList"   ???
                    property string type: "model"
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

        }


    }


}


