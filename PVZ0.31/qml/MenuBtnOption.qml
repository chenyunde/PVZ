import QtQuick 2.0

Item {
    id:optionBtn
    width: 39
    height: 19
    Image {
        id: optionBg
        anchors.fill: parent
        visible: false
        source: "../assets/images/interface/SurfaceOption.png"
    }
    signal clicked

    MouseArea {
        anchors.fill: parent
        onPressed: optionBg.visible = true
        onReleased: optionBg.visible = false
        onClicked: gameWindow.state = "optionScene"
    }
}
