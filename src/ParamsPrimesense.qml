import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

TabView {
    style:tabStyle
    Tab {
        id:tab
        title: "Parameters"
        Column{
            anchors.fill:parent
            anchors.margins: 10
            spacing: 10
            Text{text: "Type: "+"PrimeSenseCamera"}
            Column{
                spacing:3
                Text{text: "Name: "}
                TextField{text: "Camera1"}
            }
            CheckBox {
                text: qsTr("Enabled")
                checked: true
            }
            Column{
                spacing:3
                Text{text: "Devices: "}
                TableView {
                    id:view
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
                        myWidget.module_select(view.currentRow);
                    }
                }
            }
            Column{
                spacing:3
                Text{text: "Res/FPS: "}
                ComboBox {
                    width: tab.width-20
                    model: [ "640x480,  30 FPS", "320x240,  60 FPS" ]
                }
            }
            Column{
                spacing:3
                Text{text: "Outputs: "}
                CheckBox {
                    text: qsTr("Depth")
                    checked: true
                }
                CheckBox {
                    text: qsTr("RGB")
                    checked: true
                }
                CheckBox {
                    text: qsTr("XYZ")
                    checked: false
                }
                CheckBox {
                    text: qsTr("XYZ+RGB")
                    checked: false
                }
                CheckBox {
                    text: qsTr("Labels")
                    checked: false
                }
                CheckBox {
                    text: qsTr("Skeleton")
                    checked: false
                }
            }
        }
    }
}
