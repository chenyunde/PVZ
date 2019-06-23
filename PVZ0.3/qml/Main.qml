import Felgo 3.0
import QtQuick 2.0

GameWindow {
    id: gameWindow
    screenWidth: 900
    screenHeight: 600

    property var jsonObject: jsondata
    property string myName: jsonObject.name
    property bool myMusic:{
        jsondata.music == 1
        ? true : false
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
        }
    ]
}
