import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Component{
    TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                //color: styleData.selected ? "steelblue" :"lightsteelblue"
                //color:"white"
                color:"#EEEEEE"
                border.color: "black"

                implicitWidth: Math.max(text.width + 4, 80)
                implicitHeight: 20
                //radius: 2
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: styleData.title
                    color:"black"
                }
            }
            frame: Rectangle { color: "#EEEEEE"; border.color: "black" }
        }
}
