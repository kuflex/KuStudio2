import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2


Component{
ButtonStyle {
        background: Rectangle {
            implicitWidth: 60
            implicitHeight: 20
            border.width: control.activeFocus ? 4 : 1
            border.color: "#888"
            radius: 2
            gradient: Gradient {
                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
            }
        }
    }
}
