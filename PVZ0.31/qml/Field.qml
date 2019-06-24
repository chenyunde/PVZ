import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:field
    entityType: "field"
    width: 42
    height: 51

    //是否存在植物
    property bool isExistPlant: false

    //植物组件
    property Component plantComponent: null
    //子弹组件
    property Component peaComponent: null

    property var plantInField
    property var peaInField

    Rectangle{
        id:rect
        anchors.fill: parent
        color: "red"
        opacity: 0.3
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(gameWindow.onlyPlant != 0){
                if(!isExistPlant){
                    creatPlant()
                    gameWindow.onlyPlant -= 1
                    isExistPlant = true
                    currentPlant.starCool()
                }
            }
        }
    }

    function creatPlant(){

        //创建植物
        if(field.plantComponent === null){
            field.plantComponent = Qt.createComponent(gameWindow.imageName + ".qml")
        }
        var obj1
        if(field.plantComponent.status === Component.Ready){
            obj1 = field.plantComponent.createObject(gameWindow.scene, {"x": 135 + (index%9)*44, "y": 40+Math.floor(index/9)*53,"field":field})
            plantInField = obj1
        }
        //创建子弹
        if(gameWindow.imageName == "Peashooter"){
            if(field.peaComponent === null){
                field.peaComponent = Qt.createComponent("Pea.qml")
            }
            var obj2
            if(field.peaComponent.status === Component.Ready){
                obj2 = field.peaComponent.createObject(gameWindow.scene, {"x": 135 + (index%9)*44, "y": 40+Math.floor(index/9)*53,"field":field})
                peaInField = obj2
            }
        }
        gameWindow.sunNumber -= plantInField.needsun
    }

    function deletePlant(){
        field.plantComponent = null
        field.isExistPlant = false
        field.plantInField.removeEntity()
        field.peaComponent = null
        if(field.peaInField){
            field.peaInField.removeEntity()
        }
    }
}
