import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Private 1.0

TabView {
    style:tabStyle
    property string param_name:"ortho"
    //property var prop:params_fill()


    ListModel{
        id:dataResol
    }

    ListModel{
        id:dataInput
    }

    Tab {
        id:tab
        title: "Parameters"

        property string compFieldType:""
        property string nameFieldType:"type"

        property string compFieldName:""
        property string nameFieldName:"name"

        property bool compChEnabled
        property string nameChEnabled:"enabled"

        property int compXSlider:0
        property int compYSlider:0
        property int compScale:0


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
                property string name: "type";
                readOnly: true
            }


            TextLine{
                id:nameTx
                anchors.topMargin: 10
                anchors.bottomMargin: 3
                anchors.top: fieldType.bottom
                text: "Name:"
            }
            TextFields{
                id:fieldName
                anchors.topMargin: 3
                anchors.bottomMargin: 10
                anchors.top: nameTx.bottom
                text: tab.compFieldName
                property string name: "name";
//                onTextChanged:  {
//                                   mes.text="hello1";
//                                   mes.open();
//                               }
            }

            CheckBoxes {
                id:chEnabled
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.top: fieldName.bottom
                text: qsTr("Enabled")
                checked:tab.compChEnabled
                property string name: "enabled"
            }

            TextLine{
                id:resolTx
                anchors.topMargin: 10
                anchors.bottomMargin: 3
                anchors.top: chEnabled.bottom
                text: "Resolution:"
            }

            ComboBox {
                id:resol
                anchors.topMargin: 3
                anchors.bottomMargin: 10
                anchors.top: resolTx.bottom
                width: tab.width-20
                textRole: "name"
                model:dataResol
                property string type: "model"
                property string name: "threadList"
            }

            TextLine{
                id:inputTx
                anchors.topMargin: 10
                anchors.bottomMargin: 3
                anchors.top: resol.bottom
                text: "Input:"
            }

            ComboBox {
                id:input
                anchors.topMargin: 3
                anchors.bottomMargin: 10
                anchors.top: inputTx.bottom
                width: tab.width-20
                textRole: "name"
                model:dataInput
                property string type: "model"
                property string name: "threadList"
            }

            //Rectangle{
            GroupBox {
                id:rect
                anchors.topMargin: 10
                anchors.top: input.bottom
                anchors.left:parent.left
                anchors.right:parent.right
                //anchors.margins: 3
                height: 200
                width:parent.width
//                style: Style {
//                    property Component panel: Rectangle {
//                        color:"#EEEEEE"
//                        border.color:"black"
//                    }
//                }

                TextLine{
                    id:posTx
                    anchors.fill:parent
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 7
                    text: "Position"
                }
                TextLine{
                    id:xText
                    anchors.fill:posTx
                    anchors.topMargin: 20
                    anchors.bottomMargin: 7
                    anchors.leftMargin:1
                    text: "X:  "+xSlider.value
                }
                Slider{
                    id:xSlider
                    anchors.topMargin: 15
                    anchors.bottomMargin: 10
                    anchors.top: xText.top
                    anchors.leftMargin:7
                    anchors.rightMargin:3
                    width:parent.width-8

                    minimumValue: 0
                    maximumValue: 5000
                    stepSize: 20

                    value:tab.compXSlider
                }

                TextLine{
                    id:yText
                    anchors.fill:xSlider
                    anchors.topMargin: 25
                    anchors.bottomMargin: 7
                    anchors.leftMargin:7
                    text: "Y:  "+ySlider.value
                }
                Slider{
                    id:ySlider
                    anchors.topMargin: 15
                    anchors.bottomMargin: 3
                    anchors.top: yText.top
                    anchors.leftMargin:7
                    anchors.rightMargin:3
                    width:parent.width-8

                    minimumValue: 0
                    maximumValue: 5000
                    stepSize: 20

                    value:tab.compYSlider
                }

                TextLine{
                    id:scaleTx
                    anchors.top:ySlider.bottom
                    anchors.topMargin: 25
                    anchors.bottomMargin: 7
                    anchors.leftMargin:7
                    text: "Scale:  "+scale.value
                }
                Slider{
                    id:scale
                    anchors.topMargin: 15
                    anchors.bottomMargin: 3
                    anchors.top: scaleTx.bottom
                    anchors.leftMargin:7
                    anchors.rightMargin:3
                    width:parent.width-8

                    minimumValue: 0
                    maximumValue: 5000
                    stepSize: 20

                    value: tab.compScale
                }


            }

        }
    }
    function params_fill(){
        dataResol.clear();
        dataInput.clear();

        tab.compFieldType="Ortho";
        tab.compFieldName="Ortho1";
        tab.compChEnabled=true;

        dataResol.append({"name":"1200x600"});
        dataResol.append({"name":"1200x800"});
        dataResol.append({"name":"1200x2400"});

        dataInput.append({"name":"PointCloud"});

        tab.compXSlider=500;
        tab.compYSlider=1000;
        tab.compScale=3000;
    }
}
