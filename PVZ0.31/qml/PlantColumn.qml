import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:plantColumn
    entityId: "plantColumn"

    Image {
        id: cardSlot
        anchors.fill: parent
        source: "../assets/images/interface/CardSlot.png"

        //阳光数量
        Item{
            x:4
            y:32
            width: 30
            height: 10
            Text {
                id: sunNum
                anchors.centerIn: parent
                text: String(sunNumber)
                color: "black"
                font.pixelSize: 12
            }
        }
    }

    Row{
        spacing: 10
        x:45
        y:5
        Repeater{
            model:["Sunflower","Peashooter","WallNut"]
            PlantCard{
                plantName: modelData
                coolingTime: gameWindow.coolTimes[index]
            }
        }
    }

    NumberAnimation on y{
        id:plantMenuApper
        duration: 500
        to:0
        running: false
    }

    function appear(){
        plantMenuApper.restart()
    }
}
