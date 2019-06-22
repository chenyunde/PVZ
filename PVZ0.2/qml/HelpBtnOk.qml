import QtQuick 2.0

Item {
    id:helpOkBtn
    width: 80
    height: 20

    signal clicked
    signal pressed
    signal released
    Item {
        width: 92
        height: 19
        anchors.centerIn: parent
        opacity: 1
        MouseArea{
            anchors.fill: parent
            onClicked: gameWindow.state = "menuScene"
            onPressed: helpBg.source = "../assets/images/interface/HelpWidgetHighlight.png"
            onReleased: helpBg.source = "../assets/images/interface/HelpWidgetNormal.png"
        }
    }
}
