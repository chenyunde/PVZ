import QtQuick 2.0

Item {
    id:startAdventureBtn
    width: 174
    height: 80
    rotation: 1
    Image {
        id: startAdventureBg
        anchors.fill: parent
        source: "../assets/images/interface/StartAdventureNormal.png"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: startAdventureBg.source = "../assets/images/interface/StartAdventureHighLight.png"
        onReleased: startAdventureBg.source = "../assets/images/interface/StartAdventureNormal.png"
        onClicked: gameWindow.state = "levelScene"
    }
}
