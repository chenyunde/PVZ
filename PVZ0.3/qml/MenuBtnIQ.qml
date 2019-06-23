import QtQuick 2.0

Item {
    id:startIQBtn
    width: 166
    height: 75
    rotation: 1
    Image {
        id: startIQBg
        anchors.fill: parent
        source: "../assets/images/interface/StartIQNormal.png"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: startIQBg.source = "../assets/images/interface/StartIQHighLight.png"
        onReleased: startIQBg.source = "../assets/images/interface/StartIQNormal.png"
    }
}


