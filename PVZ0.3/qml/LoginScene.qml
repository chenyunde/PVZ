import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

// EMPTY SCENE

Scene {
    Rectangle{
        anchors.fill: parent
        Image {
            id:menu
            width: 60
            height: 20
            anchors.right: parent.right
            anchors.top: parent.top
            source: "../assets/images/interface/MenuButtonNormal.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gameWindow.state = "menuScene"
                }
                onPressed: {
                    menu.source = "../assets/images/interface/MenuButtonHighlight.png"
                }
                onReleased: {
                    menu.source = "../assets/images/interface/MenuButtonNormal.png"
                }
            }
        }
        Rectangle{
            id:name
            width: 200
            height: 40
            x:0
            y:0
            Label{
                width: 100
                height: 40
                anchors.left: parent.left
                text: "Enter your name:"
            }
            TextInput{
                id:aa
                width: 100
                height: 40
                activeFocusOnPress: true
                anchors.right: parent.right
                font.pixelSize: 12
                validator: RegExpValidator{
                    regExp: new RegExp("([A-z]{10})");
                }
            }
        }
        Rectangle{
            width: 30
            height: 30
            color: "blue"
            anchors.left: name.right
            anchors.leftMargin: 5
            anchors.top: parent.top
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    myName = aa.text
                    jsonObject.name = myName
                    jsondata.name = jsonObject.name
                    jsonObject.save()
                    jsondata.save()
                    gameWindow.state = "menuScene"
                }
            }
        }
    }
}
