import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1


TabView {
    id:mainTab
    style:tabStyle
    property string param_name:"preview"
    property var prop:params_fill()

    Component.onCompleted: {
       //params_fill();
    }

    ListModel{
        id:dataFps
    }

    ListModel{
        id:dataInputs
    }


    Tab {
        id:tab
        title: "Parameters"
        property bool compEnabled
        property string senderName:""



        Item{
            id:item
             anchors.fill:parent
             anchors.margins: 5



            Text{
                id:typeTx
                anchors.top: parent.top
                text: "Type: "
            }

            TextFields{
                id:fieldType
                anchors.topMargin: 3
                anchors.top: typeTx.bottom
                text:"Preview"
                property string name: "type";
            }

            Text{
                id:name
                anchors.topMargin: 7
                anchors.top: fieldType.bottom
                text: "Name: "
            }

            TextField{
                id:sender
                anchors.topMargin: 3
                anchors.bottomMargin: 7
                anchors.top: name.bottom
                text: tab.senderName //"Sender1"
            }

           CheckBox {
                id:enabled
                anchors.topMargin: 7
                anchors.bottomMargin: 7
                anchors.top: sender.bottom
                text: "Enabled"
                checked: tab.compEnabled
            }

           TextLine{
               id:fpsTx
               anchors.topMargin: 7
               anchors.bottomMargin: 3
               anchors.top: enabled.bottom
               text: "FPS:"
           }
           ComboBox {
               id:fps
               anchors.topMargin: 3
               anchors.bottomMargin: 10
               anchors.top: fpsTx.bottom
               width: tab.width-20
               textRole: "name"
               //model: [ "640x480,  30 FPS", "320x240,  60 FPS" ]
               model:dataFps
               property string name:"resolutionList"
               property string type: "model"
           }
           //Rectangle{
               //id:rect
               //border.color: "red"
               //border.width: 5
               //color:"#FFFF99"

               //anchors.fill: parent

               //anchors.topMargin: 10
               //anchors.bottomMargin: 3
               //anchors.leftMargin: 2
               //anchors.rightMargin: 2
               //anchors.right: parent.right
               //anchors.left: parent.left
               //anchors.top: fps.bottom

               TextLine{
                   id:inputsTx
                   anchors.topMargin: 10
                   anchors.bottomMargin: 3
                   anchors.top: fps.bottom
                   text: "Inputs:"
               }

               TableView {
                   id:inputs
                   anchors.topMargin: 3
                   anchors.bottomMargin: 7
                   anchors.top: inputsTx.bottom
                   property string type: "model"
                   width:tab.width-20
                   height:120
                   model: dataInputs
                   headerVisible: false
                   backgroundVisible:false
                   alternatingRowColors:false
                   focus: true
                   TableViewColumn {
                           role: "name"
                           width: parent.width
                       }
                   onClicked: {
                       //bridge.module_select(view.currentRow);
                   }
                   property string name: "deviceList"
               }

               Row{
                   id:rowBut
                   anchors.topMargin: 7
                   anchors.bottomMargin: 7
                   anchors.top: inputs.bottom

                   spacing:3
                   Button{id: butAdd; text:"Add"}
                   Button{id: butDel; text:"Delete"}
               }

               TextLine{
                   id:range0Tx
                   anchors.topMargin: 5
                   anchors.bottomMargin: 3
                   anchors.top: rowBut.bottom
                   text: "Range0, mm"
               }

               Slider{
                   id:range0
                   anchors.topMargin: 3
                   anchors.bottomMargin: 3
                   anchors.top: range0Tx.bottom
                   width:parent.width

                   minimumValue: 0
                   maximumValue: 5000
                   stepSize: 20
               }

               TextLine{
                   id:text0
                   anchors.topMargin: 3
                   anchors.bottomMargin: 2
                   anchors.right: parent.right
                   anchors.top: range0.bottom
                   text: range0.value
               }

               TextLine{
                   id:range1Tx
                   anchors.topMargin: 2
                   anchors.bottomMargin: 3
                   anchors.top: text0.bottom
                   text: "Range1, mm"
               }

               Slider{
                   id:range1
                   anchors.topMargin: 3
                   anchors.bottomMargin: 2
                   anchors.top: range1Tx.bottom
                   width:parent.width

                   minimumValue: 0
                   maximumValue: 5000
                   stepSize: 20
               }

               TextLine{
                   id:text1
                   anchors.topMargin: 2
                   anchors.bottomMargin: 10
                   anchors.right: parent.right
                   anchors.top: range1.bottom
                   text: range1.value
               }
           //}


        }
    }
    function params_fill(){

        tab.senderName="Preview1";

        tab.compEnabled=true;

    }


}

/*TabView {
    style:tabStyle
    property string param_name:"preview"
    Tab {
        id:tab
        title: "Parameters"
        property var comp:enabled
        Column{

            Component.onCompleted: {
               params_fill();
            }
            anchors.fill:parent
            anchors.margins: 10
            spacing: 10
            Text{text: "Type: "+"Preview"}
            Column{
                spacing:3
                Text{text: "Name: "}
                TextField{text: "Sender1"}
            }
            CheckBox {
                id:enabled
                text: qsTr("Enabled")
                //checked: true
            }

        }


    }
    function params_fill(){
        //tab.comp.checked=true;
       mes.text="goodbuy";
       mes.open();

    }


}*/
