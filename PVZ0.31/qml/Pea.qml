import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id:pea
    x:10
    y:38
    width: 20
    height: 20
    visible: false
    property string pPath : "../assets/images/plant/pea.gif"

    //处于那块田
    property var field

    //被那只僵尸咬
    property var beZombies : null

    //表明身份
    property bool isBullet: true



    AnimatedImage{
        id:root
        anchors.fill: parent
        source: pPath
        playing: true
    }


    BoxCollider{
        id:peaBox
        collisionTestingOnlyMode: true

        anchors.fill: pea

        categories: Box.Category5

        collidesWith: Box.Category6

        fixture.onBeginContact: {
            //暂停前进动画
            peaMove.stop()
            pea.beZombies = other.getBody().target
            if(pea.beZombies.currentBlood == 0){
//                startShoot.stop()
                zombieDead.restart()
            }
        }
    }
    //位置重置
    NumberAnimation on x {
        id:peaMove
        to:600
        running: false
        //1000*(470-parent.x)/107
        duration: 3000
        onStopped: {
            pea.visible = false
            pea.x = field.x + 135 + 10
        }
    }

    //每3秒攻击一次
    Timer {
        id:startShoot
        interval: 1400
        repeat: true
        running: true
        onTriggered: {
            pea.visible = true
            pea.x = field.x + 135 + 10
            peaMove.restart()
        }
    }

    //僵尸死亡
    Timer{
        id:zombieDead
        interval: 1000
        running: false
        repeat: false
        onTriggered: {
            pea.beZombies.removeEntity()
        }
    }
}
