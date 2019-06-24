import QtQuick 2.0
import Felgo 3.0
Plant {
    id:peashooter
    pBlood: 300
    currentBlood: 300
    pPath: "../assets/images/plant/Peashooter.gif"
    width: 30
    height: 38
    needsun: 100
    Item {
        width: 30
        height: 38
        AnimatedImage {
            id:root
            anchors.fill: parent
            source:pPath
            playing: true
        }
    }

    BoxCollider{
        id:boxcollider
        collisionTestingOnlyMode: true
        anchors.centerIn: peashooter
        categories: Box.Category5
        collidesWith: Box.Category6
        fixture.onBeginContact: {
            attached = true
            peashooter.beZombies = other.getBody().target
        }
    }
    onAttachedChanged: {
        if(attached){
            lifeReduction.restart()
        }else{
            lifeReduction.stop()
        }
    }
    Timer{
        id:lifeReduction
        interval: 1000
        repeat: true
        running: false
        onTriggered: {
            currentBlood -= 100
            console.log(currentBlood)
        }
    }

    onCurrentBloodChanged: {
        if(currentBlood == 0){
            lifeReduction.stop()
            field.deletePlant()
            peashooter.beZombies.startGo()
            peashooter.beZombies.attact = false
        }
    }
}
