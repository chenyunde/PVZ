import QtQuick 2.0
import Felgo 3.0
Scene {


    id: gamScene
    width: 480
    height: 320

    PhysicsWorld{
        id:physicsWorld
    }
    //背景
    Image {
        id: map
        x:0
        y:0
        anchors.bottom: parent.gameWindowAnchorItem.bottom
        anchors.top: parent.gameWindowAnchorItem.top
        //source: "../assets/images/interface/background1.jpg"
        source: levelBg
        Image {
            id: menuBg
            width: 60
            height: 20
            x:515
            opacity: 1
            anchors.top:parent.top
            source: "../assets/images/interface/MenuButtonNormal.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    //entityManager.removeAllEntities()
                    gameWindow.state = "menuScene"
                }
                onPressed: {
                    menu.source = "../assets/images/interface/MenuButtonHighlight.png"
                }
                onReleased: {
                    menu.source = "../assets/images/interface/MenuButtonNormal.png"
                }
            }
        }
    }
    //车
    Cars{
        id:carsView
        x:0
        y:50
    }

    //种植区域
    Fields{
        id:fieldsView
        x:135
        y:40
    }

    //植物栏
    PlantColumn{
        id:plantColumnView
        x:100
        y:-45
        width: gamScene.width / 2
        height: 45
    }
    //动画顺序
    SequentialAnimation on x{
        PropertyAnimation {
            to:-530
            duration: 5300
        }
        PropertyAnimation {
            to: -180
            duration: 3500
        }
        onStopped: {
            carsView.appear()
            plantColumnView.appear()
            zombies.start1Go()
        }
    }
    Zombies{
        id:zombies
    }
}
