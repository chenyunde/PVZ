import QtQuick 2.0

Item {
    id:exitOkBtn
    width: 460
    height: 310
    Image {
        id: exitOkBg
        anchors.fill: parent
        visible: false
        source: "../assets/images/interface/ExitMainWidgetOK.png"
    }

    signal clicked

    Rectangle {
        x:145
        y:188
        width: 79
        height: 20
        opacity: 0
        MouseArea {
            anchors.fill: parent
            onPressed: exitOkBg.visible = true
            onReleased: exitOkBg.visible = false
            onClicked: {
                Qt.quit()
            }
        }
    }
}
