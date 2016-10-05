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
            Text{text: "Type: "+"VideoPlayer"}
            Column{
                spacing:3
                Text{text: "Name: "}
                TextField{text: "Video1"}
            }
            CheckBox {
                text: qsTr("Enabled")
                checked: true
            }
        }
    }
}
