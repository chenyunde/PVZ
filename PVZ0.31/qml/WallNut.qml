import QtQuick 2.0
import Felgo 3.0

Plant {
    id:wallNut
    pBlood: 2000
    currentBlood: 2000
    pPath: "../assets/images/plant/0.gif"
    width: pWidth
    height: pHeight
    needsun: 50
    Item {
        anchors.fill: parent
        AnimatedImage{
            id: root
            source: pPath
            anchors.fill: parent
            playing: true
        }
    }
    BoxCollider{
        id:wallNutBox
        collisionTestingOnlyMode: true
        anchors.centerIn: wallNut
        categories: Box.Category5
        collidesWith: Box.Category6
        fixture.onBeginContact: {
            attached = true
            wallNut.beZombies = other.getBody().target
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
            wallNut.beZombies.startGo()
            wallNut.beZombies.attact = false
        } else if (currentBlood == 1000){
            pPath = "../assets/images/plant/wallnut3.gif"
        } else if (currentBlood == 500){
            pPath = "../assets/images/plant/wallnut4.gif"
        }
    }
}
