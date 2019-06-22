import Felgo 3.0
import QtQuick 2.0

// EMPTY SCENE

Scene {
    Image {
        id: optionBg
        anchors.fill: parent
        source: "../assets/bg"
        //source: "../assets/images/interface/SurfaceNormal.png"
        Item {
            id: yy
            width: 450
            height: 300
            anchors.centerIn: parent
            Image {
                id: yyBg
                source: "../assets/images/interface/MenuYYNormal.png"
                anchors.fill: parent
            }
        }
    }
    Item {
        id:sureItem
        x:163
        y:237
        width: 155
        height: 35
        opacity: 1
        MouseArea {
            anchors.fill: parent
            onPressed:{
                if(musicItem.music){
                    if(soundEffectItem.soundEffect){
                        yyBg.source = "../assets/images/interface/MenuYYHighlight.png"
                    } else {
                        yyBg.source = "../assets/images/interface/MenuYNHighlight.png"
                    }
                } else {
                    if(soundEffectItem.soundEffect){
                        yyBg.source = "../assets/images/interface/MenuNYHighlight.png"
                    } else {
                        yyBg.source = "../assets/images/interface/MenuNNHighlight.png"
                    }
                }
            }
            onReleased: {
                if(musicItem.music){
                    if(soundEffectItem.soundEffect){
                        yyBg.source = "../assets/images/interface/MenuYYNormal.png"
                    } else {
                        yyBg.source = "../assets/images/interface/MenuYNNormal.png"
                    }
                } else {
                    if(soundEffectItem.soundEffect){
                        yyBg.source = "../assets/images/interface/MenuNYNormal.png"
                    } else {
                        yyBg.source = "../assets/images/interface/MenuNNNormal.png"
                    }
                }
            }
            onClicked: {
                gameWindow.state = "menuScene"
            }
        }
    }
    Item {
        id:musicItem
        property bool music: true
        x:262
        y:119
        width: 15
        height: 14
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(soundEffectItem.soundEffect){
                    if(musicItem.music){
                        yyBg.source = "../assets/images/interface/MenuNYNormal.png"
                        gameMusic.stopBgm()
                        musicItem.music = false
                    } else {
                        yyBg.source = "../assets/images/interface/MenuYYNormal.png"
                        gameMusic.continueBgm()
                        musicItem.music = true
                    }
                } else {
                    if(musicItem.music){
                        yyBg.source = "../assets/images/interface/MenuNNNormal.png"
                        musicItem.music = false
                    } else {
                        yyBg.source = "../assets/images/interface/MenuYNNormal.png"
                        musicItem.music = true
                    }
                }
            }
        }
    }
    Item {
        id:soundEffectItem
        property bool soundEffect: true
        x:262
        y:151
        width: 15
        height: 14
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(musicItem.music){
                    if(soundEffectItem.soundEffect){
                        yyBg.source = "../assets/images/interface/MenuYNNormal.png"
                        soundEffectItem.soundEffect = false
                    } else {
                        yyBg.source = "../assets/images/interface/MenuYYNormal.png"
                        soundEffectItem.soundEffect = true
                    }
                } else {
                    if(soundEffectItem.soundEffect){
                        yyBg.source = "../assets/images/interface/MenuNNNormal.png"
                        soundEffectItem.soundEffect = false
                    } else {
                        yyBg.source = "../assets/images/interface/MenuNYNormal.png"
                        soundEffectItem.soundEffect = true
                    }
                }
            }
        }
    }
}







