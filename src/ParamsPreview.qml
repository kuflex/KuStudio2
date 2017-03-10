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


    Tab {
        id:tab
        title: "Parameters"
        property var comp:tab.children.children
        property bool compEnabled:false



        Item{
            id:item
             anchors.fill:parent
             anchors.margins: 5



            Text{
                id:type
                anchors.top: parent.top
                text: "Type: "+"Preview"
            }

            Text{
                id:name
                anchors.topMargin: 7
                anchors.top: type.bottom
                text: "Name: "
            }



            TextField{
                id:sender
                anchors.topMargin: 3
                anchors.bottomMargin: 7
                anchors.top: name.bottom
                text: "Sender1"
            }

           CheckBox {
                id:enabled
                anchors.topMargin: 7
                anchors.bottomMargin: 7
                anchors.top: sender.bottom
                text: "Enabled"
                checked: tab.compEnabled
            }


        }
    }
    function params_fill(){

       //mes.text="goodbuy";
       //mes.open();

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
