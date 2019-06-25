import QtQuick 2.0

Item {
    id:startMiniBtn
    width: 152
    height: 70
    rotation: 3
    Image {
        id: startMiniBg
        anchors.fill: parent
        source: "../assets/images/interface/StartMiniNormal.png"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: startMiniBg.source = "../assets/images/interface/StartMiniHighLight.png"
        onReleased: startMiniBg.source = "../assets/images/interface/StartMiniNormal.png"
    }
}
