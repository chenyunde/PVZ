import Felgo 3.0
import QtQuick 2.0

// EMPTY SCENE

Scene {
    id:levelScene
    Image {
        id: level
        anchors.fill: parent
        source: "../assets/images/interface/level.jpg"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            gameWindow.state = "menuScene"
        }
    }
}
