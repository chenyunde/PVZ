import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:car
    entityType: "car"

    width: 36
    height: 22
    parent: gameWindow.scene

    //是否为车
    property bool isCar: true
    //撞上的僵尸
    property var zombies: null

    Image {
        id:carImage
        anchors.fill: parent
        source: "../assets/images/interface/LawnCleaner.png"
    }

    //碰撞区域
    BoxCollider{

        collisionTestingOnlyMode: true

        width: 36
        height: 10

        categories: Box.Category1

        collidesWith: Box.Category6

        fixture.onBeginContact: {
            carMove.restart()
            zombies = other.getBody().target
            car.zombies.removeEntity()
        }
    }

    //动画
    NumberAnimation on x{
        id:carMove
        to:650
        duration: 2500
        running: false
    }
}
