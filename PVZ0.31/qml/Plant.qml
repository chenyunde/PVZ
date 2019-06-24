import QtQuick 2.0
import Felgo 3.0

EntityBase{
    property int pBlood

    property string pPath

    property int pWidth:30

    property int pHeight:38

    property int currentBlood

    property bool isPlant: true

    property bool attached: false

    //处于那块田
    property var field

    //被那只僵尸咬
    property var beZombies

    //表明身份不是子弹
    property bool isBullet: false
    //表明身份不是车
    property bool isCar: false

    //所需阳光
    property int needsun: 0


}
