import QtQuick 2.0

Item {
    id:helpBtn
    width: 29
    height: 12
    Image {
        id: helpBg
        anchors.fill: parent
        visible: false
        source: "../assets/images/interface/SurfaceHelp.png"
    }
    signal clicked

    MouseArea {
        anchors.fill: parent
        onPressed: helpBg.visible = true
        onReleased: helpBg.visible = false
        onClicked: gameWindow.state = "helpScene"
    }
}
