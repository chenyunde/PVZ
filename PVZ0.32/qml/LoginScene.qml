import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

// EMPTY SCENE

Scene {
    width: 480
    height: 320
    id:loginScene
    Image {
        id: login
        source: "../assets/images/interface/login.png"

        anchors.fill: parent
        Item {
            id:menu
            width: 150
            height: 20
            rotation: -2
            x:35
            y:60
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    myName = aa.text
                    jsonObject.name = myName
                    jsondata.name = jsonObject.name
                    jsonObject.save()
                    jsondata.save()
                    gameWindow.state = "menuScene"
                    gameWindow.state = "menuScene"
                }
            }
        }
        Image {
            id: lefthand
            width: 30
            height: 30
            x:5
            y:28
            source: "../assets/images/interface/leftHand.png"
        }
        TextInput{
            id:aa
            width: 100
            height: 20
            x:60
            y:35
            activeFocusOnPress: true
            font.pixelSize: 8
            color: "lightgreen"
            validator: RegExpValidator{
                regExp: new RegExp("([A-z]{10})");
            }
        }
        Image {
            id: rightHand
            width: 30
            height: 30
            x:185
            y:28
            source: "../assets/images/interface/rightHand.png"
        }
    }
}
