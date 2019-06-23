import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.0

Scene {
    id: menuScene

    signal exitClicked
    signal helpClicked
    signal loginClicked

    Image {
        id: menubg
        anchors.fill: parent
        source: "../assets/images/interface/Surface.jpg"
        Image {
            x:120
            y:190
            width: 80
            height: 100
            source: "../assets/images/interface/111.ico"
        }
        Image {
            x:30
            y:0
            width: 160
            height: 60
            source: "../assets/images/interface/SelectorScreen_WoodSign1_32.png"
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                y:35
                text: myName
                font.pixelSize: 10
            }

        }
        Image {
            x:40
            y:91
            width: 30
            height: 30
            source: "../assets/images/interface/SelectorScreen_WoodSign3_32.png"
        }
    }
    MenuBtnAdventure {
        x:253
        y:40
    }
    MenuBtnIQ {
        x:253
        y:107
    }
    MenuBtnMini {
        x:253
        y:160
    }
    MenuBtnOption {
        x:345
        y:260
    }
    MenuBtnHelp {
        x:389
        y:281
        onClicked: helpClicked()
    }
    MenuBtnExit {
        x:432
        y:276
        onClicked: exitClicked()
    }
    MenuBtnLogin {
        x:30
        y:55
        onClicked: loginClicked()
    }
}
