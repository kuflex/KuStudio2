import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

import com.kuflex.GuiBridge 1.0


ApplicationWindow {
    id:win
    visible: true
    width: 800
    height: 600
    title: qsTr("KuStudio2")

    GuiBridge{
        id:myWidget
    }


    AddModule{
        id:dlg
    }
    DataType{
        id:dataType
    }
    DataName{
        id:dataName
    }

    Component.onCompleted: {
       load_module_list();
    }


    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&New project")
                //onTriggered: newProjDlg.open();
            }
            MenuItem {
                text: qsTr("&Open project...")
                onTriggered: projOpenDlg.open();
            }
            MenuItem {
                text: qsTr("&Save")
                //onTriggered: ;
            }
            MenuItem {
                text: qsTr("&Save As...")
                onTriggered: saveAsDlg.open();
            }
            MenuSeparator{}
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
        Menu {
            title: qsTr("Help")
            MenuItem {
                text: qsTr("About")
                onTriggered: aboutDlg.open()
            }
        }
    }

    FileDialog{
        id:projOpenDlg
        title:"New Project"
        nameFilters: ["*.ku2"]

        onAccepted: {
            var filename=projOpenDlg.fileUrl;
            myWidget.project_open(filename);
            //mes.text=filename;
            //mes.open();
        }

    }

    FileDialog{
        id:saveAsDlg
        title:"New Project"
        nameFilters: ["*.ku2"]
        selectMultiple: false
        selectExisting: false

        onAccepted: {
            var filename=saveAsDlg.fileUrl;
            //my.save(filename, fileDlg.text);
            myWidget.project_save_as(filename);
            //mes.text=filename;
            //mes.open();
        }

    }

    MessageDialog{
        id:mes
    }

    MessageDialog{
        id:aboutDlg
        title:"About"
        text:"KuStudio2\nversion 1.0"
    }
    MessageDialog{
        id:delModDlg
        text:"Delete module?"
        title: win.title

        standardButtons: StandardButton.Ok | StandardButton.Cancel
        //icon: StandardIcon.Warning

        onAccepted: {
            myWidget.module_delete();
            delModDlg.close();
            refresh_module_list();
        }
    }


    /*Grid {
            x: 5; y: 5
            rows: 5; columns: 5; spacing: 10
            Repeater { model: 25
                               Rectangle { width: 70; height: 70
                                           color: "lightgreen"

                                           Text { text: index
                                                  font.pointSize: 30
                                                  anchors.centerIn: parent } }
            }
    }*/


Rectangle{
    width:parent.width;
    height:parent.height;
    color:"lightblue"

    Rectangle{
        id:leftPart
        anchors.margins: 5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width:rowBut.width;
        color:"lightblue"


            Component {
                id: myDelegate
                    //Text { text: name + ",    " + type }
                    Text { text: name }
            }
            Rectangle{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: rowBut.top
                border.color:"black"


                TableView {
                    id:view
                    anchors.margins: 3
                    anchors.fill: parent
                    model: dataName
                    headerVisible: false
                    backgroundVisible:false
                    alternatingRowColors:false
                    focus: true
                    TableViewColumn {
                            role: "name"
                            //title: "Title"
                            width: 100
                        }
                }
            }
            Row{
                id:rowBut
                spacing:5
                anchors.bottom: parent.bottom
                Button{id: butAdd; text:"Add"; onClicked: dlg.visible=true;}
                Button{
                    id: butDel;
                    text:"Delete";
                    onClicked:{
                        myWidget.module_select(view.currentRow);
                        if (view.currentRow!=-1) delModDlg.open();
                    }
               }
            }


    }
    Rectangle{
        id:centralPart
        anchors.margins: 5
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftPart.right
        anchors.right: rightPart.left

        border.color:"black"
    }
    Rectangle{
        id:rightPart
        anchors.margins: 5
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width:150;

        border.color:"black"
    }
}

function refresh_module_list(){
    var temp=myWidget.module_names();
    var count=myWidget.module_count();
    dataName.clear();
    for(var i=0; i<count; i++){
       dataName.append({"name":temp[i]});
    }
}

function load_module_list(){
    var temp=myWidget.module_names();
    var count=myWidget.module_count();
    for(var i=0; i<count; i++){
       dataName.append({"name":temp[i]});
    }
}

    /*Rectangle {
        width: 200; height: 250

        Text {
            id: myText
            text: "Hello"
            color: "#dd44ee"
        }

        Component {
            id: myDelegate
            Text { text: model.color }
        }

        ListView {
            anchors.fill: parent
            anchors.topMargin: 30
            model: myText
            delegate: myDelegate
        }
    }*/

    /*Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }*/
}

