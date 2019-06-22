import Felgo 3.0
import QtQuick 2.0

// EMPTY SCENE

Scene {
    Image {
        id:loginBg
        anchors.fill: parent
        source: "../assets/bg"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menuScene"
            }
        }
    }
}
