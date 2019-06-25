import QtQuick 2.0
import QtMultimedia 5.0
import Felgo 3.0
ZombyBase{
    id:screedoorBase
    width: 40
    height: 48
    blood: 300+200 + 70
    currentBlood: 300 + 200 + 70
    aggressivity: 100
    speed: 10
    property bool hasDoor: true

    Item {
        id: root
        anchors.fill: parent
        AnimatedImage {
            id: head
            anchors.fill: parent
            visible: false
            opacity: 0
            source: "../assets/Zombies/Zombie/ZombieHead.gif"
            NumberAnimation on opacity{
                id:headLose
                to:1
                duration: 1000
                onStarted: {
                    head.playing = true
                    head.visible = true
                }
                onStopped: {
                    head.visible = false
                }
            }
        }
        AnimatedImage {
            id: zomzy
            anchors.fill: parent
            source: "../assets/Zombies/ScreenDoorZombie/1.gif"
            playing: true
        }
    }


    //碰撞区域
    BoxCollider{
        collisionTestingOnlyMode: true
        width: screedoorBase.width / 2
        height: screedoorBase.height - 20
        x:screedoorBase.width / 2
        y:20
        categories: Box.Category6
        collidesWith: Box.Category5 | Box.Category1
        fixture.onBeginContact: {
            var judgetype = other.getBody().target
            if(judgetype.isCar){
                currentBlood = 0
            }else{
                if(judgetype.isBullet){
                    attactz.play()
                    currentBlood -= 25
                }else{
                    if(!beExploed){
                        attactPlant()
                        zombyBase.plantAttach = judgetype
                    }
                }
            }
        }
    }
    //音效
    Video{
        id:attactBgm
        autoPlay: false
        volume:1
        source :""
        loops: MediaPlayer.Infinite
    }
    Video{
        id:attactz
        autoPlay: false
        volume:1
        source : "../assets/sound/hitIron.mp3"
        loops: 1
    }


    //前进动画
    NumberAnimation on x{
        id:starX
        to:0
        //
        duration: (x/ speed) * 1000
        running: false
    }

    //前进函数
    function startGo(){
        //更换图片
        zomzy.source = "../assets/Zombies/ScreenDoorZombie/HeadWalk1.gif"
        //开始动图
        zomzy.playing = true
        //开始动画
        starX.restart()
    }

    //攻击植物
    function attactPlant(){
        attact = true
    }

    //攻击植物
    onAttactChanged: {
        if(attact){
            //停止移动
            starX.pause()
            //更换声音
            attactBgm.source = "../assets/sound/eatPlant.mp3"
            //播放声音
            attactBgm.play()
            //根据当前血量更换图片
            if(currentBlood > 270){
                //门好
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/HeadAttack1.gif"
            }else if(70 < currentBlood <= 270){
                //门坏
                console.log("270")
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/ScreenDoorZombieAttack.gif"
            }else if(0<=currentBlood && currentBlood<= 70){
                //没脑袋
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/LostHeadAttack1.gif"
            }
        }else{
            //继续移动
            starX.restart()
            //停止声音
            attactBgm.source = ""
            //根据当前血量更换图片
            if(currentBlood > 270){
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/HeadWalk1.gif"
            }else if(70 < currentBlood <= 270){
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/HeadWalk1.gif"
            }else if(0<=currentBlood && currentBlood<= 70){
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/LostHeadWalk1.gif"
            }

        }
    }


    //判断血量
    onCurrentBloodChanged: {
        console.log("onCurrentBloodChanged:"+currentBlood)
        if(currentBlood == 270){
            hasDoor = false
        }
        if(currentBlood == 70){
            headLose.restart()
            if(attact){
               zomzy.source = "../assets/Zombies/ScreenDoorZombie/ScreenDoorZombieAttack.gif"
            }else{
               zomzy.source = "../assets/Zombies/ScreenDoorZombie/LostHeadWalk1.gif"
            }
        }else if(currentBlood == 0){
            //更换死亡图片
            if(beExploed){  ////是否被炸死
                zomzy.source = "../assets/Zombies/NewspaperZombie/BoomDie.gif"
            }else{
                zomzy.source = "../assets/Zombies/Zombie/ZombieDie.gif"
            }
            starX.stop()
            attactBgm.stop()
        }else if(currentBlood < 0){
            currentBlood = 0
        }
    }

    onHasDoorChanged: {
        if(!hasDoor){
            if(attact){
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/HeadAttack1.gif"
            }else{
                zomzy.source = "../assets/Zombies/ScreenDoorZombie/HeadWalk1.gif"
            }
        }
    }
    //判断是否到底
    onXChanged: {
        if(x == 0){
            console.log("到达底部")
        }
    }

    onBeExploedChanged: {
        if(beExploed){
            currentBlood = 0
            console.log("onBeExploedChanged:"+currentBlood)
        }
    }
}
