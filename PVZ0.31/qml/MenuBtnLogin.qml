import QtQuick 2.0

Item {
    signal clicked
    id:startIQBtn
    width: 160
    height: 40
    Image {
        id: startIQBg
        anchors.fill: parent
        source: "../assets/images/interface/SelectorScreen_WoodSign2_8111.png"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: startIQBg.source = "../assets/images/interface/SelectorScreen_WoodSign2_8222.png"
        onReleased: startIQBg.source = "../assets/images/interface/SelectorScreen_WoodSign2_8111.png"
        onClicked: {
            gameWindow.state = "loginScene"
        }
    }
}

