import Felgo 3.0
import QtQuick 2.0

// EMPTY SCENE



Scene {
    width: 480
    height: 320
    id:levelScene
    Image {
        id: level
        anchors.fill: parent
        source: "../assets/images/interface/level.jpg"
        Item {
            width: 30
            height: 30
            x:60
            y:32
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    levelBg = "../assets/images/interface/background1.jpg"
                    gameWindow.state = "gameScene"
                    if(myMusic){
                        gameMusic.switchTo("Kitanai Sekai")
                    }
                }
            }
        }
        Item {
            width: 30
            height: 30
            x:105
            y:35
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    levelBg = "../assets/images/interface/background2.jpg"
                    gameWindow.state = "gameScene"
                    gameMusic.switchTo("Kitanai Sekai")
                }
            }
        }
    }
    Image {
        id: exit
        anchors.top: parent.top
        anchors.right: parent.right
        source: "../assets/images/interface/cc.png"
        MouseArea {
                anchors.fill: parent
                onClicked: {
                    gameWindow.state = "menuScene"
                }
        }
    }
}
