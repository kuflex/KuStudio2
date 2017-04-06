import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import com.kuflex.GuiBridge 1.0


ApplicationWindow {
    id:win
    visible: true
    width: 800
    height: 600
    title: qsTr("KuStudio2 "+proj)

    property double pw:800/600;

    onHeightChanged: {}
    onWidthChanged: {
        if (pw<width/height){ //расширяем окно
            if (width/height<1){
                leftPart.width=leftPart.width*height/width;
                rightPart.width=rightPart.width*height/width;
            }
            else {
                leftPart.width=leftPart.width*width/height;
                rightPart.width=rightPart.width*width/height;
            }

        }
        if (pw>width/height) {  //сворачиваем окно
            if (width/height>1){
                leftPart.width=leftPart.width*1/pw;
                rightPart.width=rightPart.width*1/pw;
            }
            else {
                leftPart.width=leftPart.width*pw;
                rightPart.width=rightPart.width*pw;
            }
        }

        pw=width/height;

    }

    property string proj:""
    property string module_type:""

    GuiBridge{
        id:bridge
    }

    TabStyle{
        id:tabStyle
    }

    ToolButtonStyle{
        id:butStyle
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


    ParamsPrimesense{
        id:paramsPrime
    }

    Component.onCompleted: {
       load_module_list();
       view.selection.select(0); //выделение первой строчки в левой части

    }


    menuBar: MenuBar {
        id:menuBar
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&New project")
                onTriggered: {bridge.project_new(); refresh_all()}
            }
            MenuItem {
                text: qsTr("&Open project...")
                onTriggered: {projOpenDlg.open(); }
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

    toolBar:ToolBar {
        id:toolBar
            RowLayout {
                anchors.centerIn: parent
                ToolButton {
                    id:butPlay
                    text:"Play"
                    //iconSource: "new.png"
                    style: butStyle
                    onClicked: {
                        butDel.enabled=false;
                        butAdd.enabled=false;
                        enabled=false;
                        //bridge.module_get_unlock("thread"); &&!!
                    }
                }
                ToolButton {
                    text:"Stop"
                    //iconSource: "open.png"
                    style: butStyle
                    onClicked: {
                        butDel.enabled=true;
                        butAdd.enabled=true;
                        butPlay.enabled=true;
                    }
                }
            }
    }

    FileDialog{
        id:projOpenDlg
        title:"New Project"
        nameFilters: ["*.ku2"]

        onAccepted: {
            var filename=projOpenDlg.fileUrl;
            bridge.project_open(filename);
            refresh_title("-");
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
            bridge.project_save_as(filename);
        }

    }

    MessageDialog{
        id:mes
    }

    MessageDialog{
        id:aboutDlg
        title:"About"
        text:"KuStudio2, version 1.0"

        standardButtons: StandardButton.Ok
        icon: StandardIcon.Information

        onAccepted: {close();}
    }
    MessageDialog{
        id:delModDlg
        text:"Delete module?"
        title: win.title

        standardButtons: StandardButton.Ok | StandardButton.Cancel
        //icon: StandardIcon.Warning

        onAccepted: {
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
    anchors.fill: parent

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
                    onClicked: {
                        bridge.module_select(view.currentRow);
                        win.module_type=bridge.get_module_type();
                        rightPart.sourceComponent=gui_get_paramTab(win.module_type);
                        //var temp=gui_get_paramTab(win.module_type);
                        //rightPart.setSource(temp);
                        //mes.text=bridge.get_module_type();
                        //paramsPrime.children.params_fill();???

                            //mes.text=view.currentRow; выводит нормально
                            //mes.text=primesense.param_name;//rightPart.sourceComponent
                        //mes.open();
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
                        //bridge.module_select(view.currentRow);
                        var flag=bridge.module_delete();
                        if (flag) delModDlg.open();
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

    /*Rectangle{
        id:rightPart
        anchors.margins: 5
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width:150;

        border.color:"black"
    }*/


    //ParamsCamera
    /*ParamsPreview{
        id:rightPart
        anchors.margins: 5
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width:150;
    }*/



    MouseArea {
        id: mouseArea
        anchors.fill: parent
        property bool flag:false
        enabled:false

        onMouseXChanged: {
                if (mouseX>=rightPart.x-25 && mouseX<=rightPart.x+25) {

                    if (rightPart.width>179 && rightPart.width<(1.0/3*win.width+10))
                         rightPart.width=parent.width-mouseArea.mouseX;
                    else if (rightPart.width<=179)
                            rightPart.width=180;
                         else rightPart.width=1.0/3*win.width+9;
                }

                if (mouseX>=centralPart.x-25 && mouseX<=centralPart.x+25) {

                    if (leftPart.width>rowBut.width-1 && leftPart.width<(1.0/3*win.width-10))
                         leftPart.width=mouseArea.mouseX;
                    else if (leftPart.width<=rowBut.width-1)
                            leftPart.width=rowBut.width;
                         else leftPart.width=1.0/3*win.width-11;
                }
        }
        onReleased: {
            mouseArea.enabled=false;
            rightMouseArea.enabled=true;
            leftMouseArea.enabled=true;
        }
    }

    MouseArea {
        id: rightMouseArea
        property bool flag:false
        x:win.width-rightPart.width-25;
        y:menuBar.height+toolBar.height;
        width:50
        height:rightPart.height;
        enabled:true

        hoverEnabled:true
        onEntered: if (containsMouse) rightMouseArea.cursorShape=Qt.SizeHorCursor;
                   else rightMouseArea.cursorShape=Qt.ArrowCursor;
        onMouseXChanged: {
           mouseArea.enabled=true;
           rightMouseArea.enabled=false;
        }
    }

    MouseArea {
        id: leftMouseArea
        property bool flag:false
        x:leftPart.width-25;
        y:menuBar.height+toolBar.height;
        width:50
        height:leftPart.height;
        enabled:true

        hoverEnabled:true
        onEntered: if (containsMouse) leftMouseArea.cursorShape=Qt.SizeHorCursor;
                   else leftMouseArea.cursorShape=Qt.ArrowCursor;
        onMouseXChanged: {
           mouseArea.enabled=true;
           leftMouseArea.enabled=false;
        }
    }

    Loader {
        id:rightPart
        anchors.margins: 5
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 180


        onLoaded: {
        }
        Component.onCompleted:{

            bridge.module_select(0);
            win.module_type=bridge.get_module_type();
            rightPart.sourceComponent=gui_get_paramTab(win.module_type);
            item.prop;
        }

    }


    Component {
        id:primesense
        ParamsPrimesense{}
    }
    Component {
        id: preview
        ParamsPreview{}
    }
    Component {
        id: ortho
        ParamsOrtho{}
    }
    Component {
        id: optFlow
        ParamsOptFlow{}
    }
    Component {
        id: pointCloud
        ParamsPointCloud{}
    }
    Component {
        id: videoPlayer
        ParamsVideoPlayer{}
    }
    Component {
        id: senderOSC
        ParamsSenderOSC{}
    }
}

function refresh_module_list(){
    var temp=bridge.module_names();
    var count=bridge.module_count();
    dataName.clear();
    for(var i=0; i<count; i++){
       dataName.append({"name":temp[i]});
    }
}

function load_module_list(){
    var temp=bridge.module_names();
    var count=bridge.module_count();
    for(var i=0; i<count; i++){
       dataName.append({"name":temp[i]});
    }
}

function refresh_title(str){
    win.proj=str+bridge.get_file_name();
}

function refresh_all(){
    refresh_module_list();
    refresh_title("");
}

function get_select_module(){
    return view.currentRow;
}

function gui_get_paramTab(type){
    if (type==="Primesense" || type==="primesense") return primesense;
    if (type==="preview" || type==="Preview") return preview;
    if (type==="PointCloud" || type==="pointCloud") return pointCloud;
    if (type==="VideoPlayer" || type==="videoPlayer") return videoPlayer;
    if (type==="ortho" || type==="Ortho") return ortho;
    return "";
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

