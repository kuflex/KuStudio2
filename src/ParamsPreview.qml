import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

TabView {
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

//            function params_fill(){
//                //mes.text="goodbuy";
//                //mes.open();
//            }
        }


    }
    function params_fill(){
        //tab.comp.checked=true;
       //mes.text="goodbuy";
       //mes.open();

    }


}
