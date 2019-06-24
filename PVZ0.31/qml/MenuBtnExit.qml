import QtQuick 2.0

Item {
    signal clicked
    id:exitBtn
    width: 33
    height: 12
    Image {
        id: exitBg
        anchors.fill: parent
        visible: false
        source: "../assets/images/interface/SurfaceExit.png"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: exitBg.visible = true
        onReleased: exitBg.visible = false
        onClicked: {
            gameWindow.state = "exitScene"
        }
    }
}
