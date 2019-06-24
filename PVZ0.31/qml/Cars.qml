import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:cars
    entityType: "cars"
    Column{
        spacing: 32
        Repeater{
            model:5
            Car{
               x:92
               y:(index + 1) * 50 + index * 5
            }

        }
    }
    //出现动画
    NumberAnimation on x{
        id:carsAppear
        to:92
        duration: 200
        running: false
   }
    //出现动画函数
    function appear(){
        carsAppear.restart()
    }
}
