import QtQuick 2.0
import Felgo 3.0
Scene {
    id: scene
    width: 480
    height: 320

    PhysicsWorld{
        id:physicsWorld
        //debugDrawVisible: true
    }
    //背景
    Image {
        id: map
        x:0
        y:0
        anchors.bottom: parent.gameWindowAnchorItem.bottom
        anchors.top: parent.gameWindowAnchorItem.top
        source: "../assets/images/interface/background1.jpg"
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
        width: scene.width / 2
        height: 45
    }
    Image {
        id: menu
        width: 60
        height: 20
        x:510
        y:-20
        source: "../assets/images/interface/MenuButtonNormal.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menuScene"
            }
            onPressed: {
                menu.source = "../assets/images/interface/MenuButtonHighlight.png"
            }
            onReleased: {
                menu.source = "../assets/images/interface/MenuButtonNormal.png"
            }
        }

        NumberAnimation on y{
            id:menuStart
            to:0
            running: false
            duration: 200
        }
        function start(){
            menuStart.restart()
        }
    }


    //动画顺序
    SequentialAnimation on x{
        PropertyAnimation {
            to:-530
            duration: 5300
        }
        PropertyAnimation {
            ////-180
            to: -180
            duration: 3500
        }
        onStopped: {
            carsView.appear()
            plantColumnView.appear()
            menu.start()
            zombies.start2Go()

        }
    }
    Zombies{
        id:zombies
    }
}
