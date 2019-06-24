import QtQuick 2.0
import Felgo 3.0

EntityBase {

    //血量
    property int blood
    //当前血量
    property int currentBlood
    //攻击力
    property int aggressivity
    //速度
    property int speed
    //是否掉头
    property bool isLoseHead : false
    //是否攻击
    property bool attact : false
    //是否被攻击
    property bool beAttact : false
    //僵尸所在的行
    property int line
    //被炸死
    property bool beExploed: false


    //表明身份不是车
    property bool isCar: false



    onLineChanged: {
        if(line == 1){
            y = 25
        }else if(line == 2){
            y = 80
        }else if(line == 3){
            y = 130
        }else if(line == 4){
            y = 185
        }else if(line == 5){
            y = 240
        }
    }
}

