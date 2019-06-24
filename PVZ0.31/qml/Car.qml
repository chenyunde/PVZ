import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:car
    entityType: "car"

    width: 36
    height: 22
    parent: gameWindow.scene

    property bool isCar: true
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
            if(zombies != other.getBody().target){
                zombies = other.getBody().target
            }
            zombieDead.restart()
        }
    }

    //动画
    NumberAnimation on x{
        id:carMove
        to:650
        duration: 2500
        running: false
    }

    //僵尸死亡
    Timer{
        id:zombieDead
        interval: 500
        running: false
        repeat: false
        onTriggered: {
            car.zombies.removeEntity()
        }
    }
}
