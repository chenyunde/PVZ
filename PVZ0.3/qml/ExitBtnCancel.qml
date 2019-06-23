import QtQuick 2.0

Item {
    id:exitCancelBtn
    width: 460
    height: 310
    Image {
        id: exitCancelBg
        anchors.fill: parent
        visible: false
        source: "../assets/images/interface/ExitMainWidgetCancel.png"
    }
    signal clicked

    Rectangle {
        x:229
        y:188
        width: 79
        height: 20
        opacity: 0
        MouseArea {
            anchors.fill: parent
            onPressed: exitCancelBg.visible = true
            onReleased: exitCancelBg.visible = false
            onClicked: {
                gameWindow.state = "menuScene"
            }
        }
    }
}
