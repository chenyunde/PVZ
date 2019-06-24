import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:fields
    entityType: "fields"

    width: 44 * 9
    height: 53 * 9

    GridView {
        id:gridView
        cellWidth: 44
        cellHeight: 53
        Repeater {
            model: 45
            Field{
                x: (index%9)*44
                y: Math.floor(index/9)*53
            }
        }
    }


}
