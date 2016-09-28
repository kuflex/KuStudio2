import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

Window {
    id:win
    title:"Add Module"

    flags: Qt.Dialog

    minimumWidth: 400
    minimumHeight: 300

    property var propName

    MessageDialog{
        id:mes
    }

    Component.onCompleted: {
        init_type_list();
    }


    //standardButtons: StandardButton.Save | StandardButton.Cancel

    /*Component {
        id: highlight
        Rectangle {
            width: 30;
            color: "#CCCCCC"; radius: 2
            y: view1.currentItem.y

        }
    }

    Component {
        id: myDelegate
            //Text { text: name + ",    " + type }
                Text {
                    anchors.left: parent.left
                    id:str
                    text: name;
                    MouseArea{
                        anchors.fill:parent
                        onClicked: view1.currentIndex=number;
                    }
                }

    }*/

      Rectangle{
       id:mainRect
       anchors.fill:parent
       color:"lightblue"

       implicitWidth: win.minimumWidth
       implicitHeight: win.minimumHeight

       ColumnLayout{
            id:column
            anchors.fill:parent
            anchors.margins: 5
            spacing:5
            Text{
                id:text1
                text:"Enter module's name:"
            }

           TextField{
               id:name
               anchors.top:text1.bottom
               anchors.margins: 5
               text:""
           }
           Text{
               id:text2
               text:"Select module's type:"
           }

           Rectangle{
                       id:list
                       anchors.top:text2.bottom
                       anchors.margins: 5
                       width:column.width
                       height:mainRect.implicitHeight/2
                       color:"#DDDDDD"
                       TableView{ //ListView
                           id:view1
                           anchors.margins: 3
                           headerVisible: false
                           backgroundVisible:false
                           alternatingRowColors:false
                           TableViewColumn {
                                   role: "type"
                                   //title: "Title"
                                   width: 150
                               }
                           TableViewColumn {
                                   role: "desc"
                                   //title: "Title"
                                   width: 300
                               }
                           anchors.fill: parent
                           model: dataType
                           focus: true
                           onFocusChanged:{
                               //mes.text=focus;
                               //mes.open();
                               //selection.select(currentRow)
                           }
                           onClicked:{
                               var ind=currentRow;
                               name.text=win.propName[ind];
                           }

                       }
                   }
           Row{
               spacing: 3
               Button{
                   id:butAdd
                   text:"Add"
                   onClicked: {
                       add_module();
                   }
               }
               Button{
                   id:butClose
                   text:"Close"
                   onClicked: {
                       win.close();
                   }
               }
           }
       }
   }

   MessageDialog{
       id:warningDlg
       text:"Select any type of module"
       title: "Warning"

       standardButtons: StandardButton.Ok
       icon: StandardIcon.Information

       onAccepted: {close();}
   }
  function init_type_list(){
      var count=myWidget.type_count();
      var types=myWidget.type_names();
      var descript=myWidget.type_desc();
      win.propName=myWidget.module_prop_name();
      for(var i=0; i<count; i++){
         dataType.append({"type":types[i], "desc":descript[i]});
      }
      //view1.resizeColumnsToContents();
  }
  function add_module(){
      if (view1.currentRow!=-1){
          var flag=myWidget.module_add(name.text, dataType.get(view1.currentRow).type);
          if (flag){refresh_module_list(); win.close();}
      }
      else warningDlg.open();
  }

}
