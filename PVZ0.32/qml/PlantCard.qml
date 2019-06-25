import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:plantCard
    entityType: "plantCard"

    width: 23
    height: 34

    property int borderWH: 1
    property string plantName: ""
    //能否点击
    property bool canClick: true
    //是否冷却
    property bool isCooling: false

    //冷却时间
    property var coolingTime

    //边框
    Image {
        id: border
        anchors.fill: parent
        visible: false
        source: "../assets/images/interface/borderImage.jpg"
    }

    //植物卡
    Image {
        id: plant
        x:borderWH
        y:borderWH
        width: plantCard.width - 2 * borderWH
        height: plantCard.height - 2 * borderWH
        source: "../assets/images/card/" + plantName + ".png"

    }

    //阴影
    Image {
        id: shadow
        x:0
        y:0
        width: 23
        height: 34
        visible: (gameWindow.sunNumber >= gameWindow.plantPrice[index]) ? false : true
        source: "../assets/images/card/DisableCard.png"

        //冷却动画
        NumberAnimation on height{
            id:cooling
            to:0
            running: false
            duration: coolingTime
            onStarted: {
                canClick = false
                shadow.visible = true
                border.visible = false
                isCooling = true
            }
            onStopped: {
                shadow.height = 34
                hideCard.restart()
                isCooling = false
            }
        }
    }

    //提供点击item
    Item {
        id: startCLick
        anchors.fill: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(canClick){
                    if(gameWindow.plantPrice[index] <= gameWindow.sunNumber){
                        //让上一个被点击的边框隐藏
                        if(gameWindow.lastSelectPlantCards != null){
                            //确保能点
                            if(gameWindow.lastSelectPlantCards.canClick){
                                gameWindow.lastSelectPlantCards.hideBorder()
                            }
                        }
                        gameWindow.imageName = plantName
                        gameWindow.onlyPlant += 1
                        gameWindow.currentPlant = plantCard
                        border.visible = true
                        gameWindow.lastSelectPlantCards = plantCard
                    }
                }
            }
        }
    }

    //冷却动画和边框函数
    function starCool(){
        cooling.restart()

    }
    //隐藏边框
    function hideBorder(){
        border.visible = false
    }

    Timer{
        id:hideCard
        running: false
        repeat: true
        interval: 100
        onTriggered: {
            if(!isCooling){
                shadow.visible = (gameWindow.sunNumber >= gameWindow.plantPrice[index]) ? false : true
                canClick = (gameWindow.sunNumber >= gameWindow.plantPrice[index])
            }
        }
    }
}
