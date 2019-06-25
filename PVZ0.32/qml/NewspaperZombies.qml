import QtQuick 2.0
import QtMultimedia 5.0
import Felgo 3.0
ZombyBase{
    id:newspaperBase
    width: 40
    height: 48
    blood: 200 + 150 + 70
    currentBlood: 200 + 150 + 70
    aggressivity: 100
    speed: 16
    property bool islosePaper: false
    Item {
        id: root
        anchors.fill: parent
        //head
        AnimatedImage {
            id: head
            anchors.fill: parent
            visible: false
            opacity: 0
            source: "../assets/Zombies/NewspaperZombie/Head.gif"
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
            source: "../assets/Zombies/NewspaperZombie/0.gif"
            playing: true
        }
    }
    BoxCollider{
        // BoxCollider不受重力或其他应用物理力的影响
        collisionTestingOnlyMode: true
        width: newspaperBase.width / 2
        height: newspaperBase.height -20
        x:newspaperBase.width / 2
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
                        newspaperBase.plantAttach = judgetype
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
        source : "../assets/sound/zo.mp3"
        loops: 1
    }
    //前进动画
    NumberAnimation on x{
        id:starX
        to:0
        duration: (x/ speed) * 1000
        running: false
    }
    //前进函数
    function startGo(){
        zomzy.source = "../assets/Zombies/NewspaperZombie/HeadWalk1.gif"
        //开始动图
        zomzy.playing = true
        //开始动画
        starX.restart()
    }
    //攻击植物
    function attactPlant(){
        attact = true
    }

    //判断血量
    onCurrentBloodChanged: {
        console.log("newspaperBase:"+currentBlood)
        if(currentBlood == 240){
            console.log("开始暴走")
            starX.stop()
            zomzy.source = "../assets/Zombies/NewspaperZombie/LostNewspaper.gif"
            wenhao.restart()
        }

        //大条件是没有头
        if(currentBlood == 60){
            headLose.restart()
            if(attact){
                if(islosePaper){
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadAttack0.gif"
                }else{
                    //LostHeadAttack1
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadAttack1.gif"
                }
            }else{
                if(islosePaper){
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadWalk0.gif"
                }else{
                    //LostHeadWalk1
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadWalk1.gif"
                }

            }
        }else if(currentBlood == 0){
            //更换死亡图片
            if(beExploed){  ////是否被炸死
                zomzy.source = "../assets/Zombies/NewspaperZombie/BoomDie.gif"
            }else{
                zomzy.source = "../assets/Zombies/NewspaperZombie/Die.gif"
            }
            starX.stop()
            attactBgm.stop()
            //删除对象
        }else if(currentBlood < 0){
            currentBlood = 0
        }
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
            if(currentBlood > 60){
                if(islosePaper){
                    zomzy.source = "../assets/Zombies/NewspaperZombie/HeadAttack0.gif"
                }else{
                    zomzy.source = "../assets/Zombies/NewspaperZombie/HeadAttack1.gif"
                }
            }else if(0<=currentBlood && currentBlood<= 60){
                if(islosePaper){
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadAttack0.gif"
                }else{
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadAttack1.gif"
                }
            }
        }else{
            starX.restart()
            //停止声音
            attactBgm.source = ""
            //根据当前血量更换图片
            if(currentBlood > 60){
                if(islosePaper){
                    zomzy.source = "../assets/Zombies/NewspaperZombie/HeadWalk0.gif"
                }else{
                    zomzy.source = "../assets/Zombies/NewspaperZombie/HeadWalk1.gif"
                }
            }else if(0<=currentBlood && currentBlood<= 60){
                if(islosePaper){
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadWalk0.gif"
                }else{
                    zomzy.source = "../assets/Zombies/NewspaperZombie/LostHeadWalk1.gif"
                }
            }
        }
    }
    onIslosePaperChanged: {
        if(islosePaper){
            if(attact){
                zomzy.source = "../assets/Zombies/NewspaperZombie/HeadAttack0.gif"
            }else{
                zomzy.source = "../assets/Zombies/NewspaperZombie/HeadWalk0.gif"
            }
        }
    }
    Timer{
        id:wenhao
        interval: 1000
        running: false
        repeat: false
        onTriggered: {
            speed = 50
            starX.restart()
            islosePaper = true
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
            console.log("beExploed")
        }
    }
}
