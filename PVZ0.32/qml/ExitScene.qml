import Felgo 3.0
import QtQuick 2.0

Scene {
    signal exitOk
    signal exitCancel
    Image {
        id:exitBg
        anchors.fill: parent
        source: "../assets/images/interface/bg"
        //source: "../assets/images/interface/SurfaceNormal.png"
        Item {
            anchors.centerIn: parent
            width: 460
            height: 310
            Image {
                id: exit
                anchors.fill: parent
                source: "../assets/images/interface/ExitMainWidgetNormal.png"
            }
        }
    }
    ExitBtnOk {
        anchors.centerIn: parent
        onClicked: exitOk()
    }
    ExitBtnCancel {
        anchors.centerIn: parent
        onClicked: exitCancel()
    }
}
