import QtQuick 2.0
import Felgo 3.0

Plant{
    id:sunflower
    pBlood: 300
    currentBlood: 300
    pPath: "../assets/images/plant/SunFlower.gif"
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
            AnimatedImage {
                id:sun
                width: 25
                height: 25
                playing: true
                visible: false
                source: "../assets/images/plant/Sun.gif"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(sun.visible){
                            sunCollectX.restart()
                            sunCollectY.restart()
                            gameWindow.sunNumber += 25
                        }
                    }
                }
                NumberAnimation on x{
                    id:sunCollectX
                    to:-sunflower.x+110
                    duration: 1000
                    running: false

                }
                NumberAnimation on y{
                    id:sunCollectY
                    to:-sunflower.y+8
                    duration: 1000
                    running: false
                    onStopped: {
                        sun.x = 0
                        sun.y = 0
                        sun.visible = false
                    }
                }
            }
        }
    }
    BoxCollider{
        id:sunflowerBox
        collisionTestingOnlyMode: true

        anchors.fill: sunflower

        categories: Box.Category5

        collidesWith: Box.Category6

        fixture.onBeginContact: {
            attached = true
            sunflower.beZombies = other.getBody().target
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
            sunflower.beZombies.startGo()
            sunflower.beZombies.attact = false
            lifeReduction.stop()
            field.deletePlant()
        }
    }

    Timer {
        id:sunApper
        interval: 12000
        running: false
        repeat: true
        onTriggered: {
            sun.visible = true
        }
    }
    Component.onCompleted: sunApper.restart()

}
