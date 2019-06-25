import Felgo 3.0
import QtQuick 2.0

GameWindow {
    id: gameWindow
    screenWidth: 960
    screenHeight: 640
    //选择植物卡的名字
    property string imageName: ""
    property alias scene: gameScene
    //选中的植物卡只能是一张
    property int onlyPlant: 0
    //当前选中的植物卡(用做冷却)
    property var currentPlant
    //阳光个数
    property int sunNumber: 5000
    //购买阳光数
    property var plantPrice: [50,100,50]
    //冷却时间
    property var coolTimes: [7500,7500,30000]
    //上一次被点击的卡片
    property var lastSelectPlantCard

    property string levelBg


    property var jsonObject: jsondata
    property string myName: jsonObject.name
    property bool myMusic:{
        jsondata.music == 1
        ? true : false
    }
    EntityManager {
      id: entityManager

      entityContainer: gameScene
    }

    GameScene{
        id:gameScene
        opacity: 0
    }
    GameMusic{
        id:gameMusic
    }

    MenuScene {
        id:menuScene
        opacity: 0
    }
    ExitScene {
        id:exitScene
        opacity: 0
    }

    HelpScene {
        id:helpScene
        opacity: 0
    }

    OptionScene {
        id:optionScene
        opacity: 0
    }

    LevelScene {
        id:levelScene
        opacity: 0
    }
    LoginScene {
        id:loginScene
        opacity: 0
    }

    state: "menuScene"

    states: [
        State {
            name: "menuScene"
            PropertyChanges {
                target: menuScene
                opacity:1
            }
        },
        State {
            name: "exitScene"
            PropertyChanges {
                target: exitScene
                opacity: 1
            }
        },
        State {
            name: "helpScene"
            PropertyChanges {
                target: helpScene
                opacity: 1
            }
        },
        State {
            name: "optionScene"
            PropertyChanges {
                target: optionScene
                opacity: 1
            }
        },
        State {
            name: "levelScene"
            PropertyChanges {
                target: levelScene
                opacity: 1
            }
        },
        State {
            name: "loginScene"
            PropertyChanges {
                target: loginScene
                opacity: 1
            }
        },State {
            name: "gameScene"
            PropertyChanges {
                target: gameScene
                opacity:1
            }
        }
    ]
}
