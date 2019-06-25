import QtQuick 2.0
import Felgo 3.0

EntityBase{
    //血量
    property int pBlood
    //图片资源路径
    property string pPath
    property int pWidth:30

    property int pHeight:38
    //当前血量
    property int currentBlood
    //是否为植物(区别子弹)
    property bool isPlant: true
    //是否为攻击状态
    property bool attached: false

    //处于那块田
    property var field

    //被那群僵尸咬
    property variant beZombies:new Array
    //僵尸数量
    property int beZombiesNumber: 0

    //表明身份不是子弹
    property bool isBullet: false
    //表明身份不是车
    property bool isCar: false

    //所需阳光
    property int needsun: 0


}
