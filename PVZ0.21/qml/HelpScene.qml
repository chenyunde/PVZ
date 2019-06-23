import Felgo 3.0
import QtQuick 2.0

// EMPTY SCENE

Scene {
    signal onOkClicked
    Image {
        id: helpBg
        anchors.fill: parent
        source: "../assets/images/interface/HelpWidgetNormal.png"
    }
    HelpBtnOk {
        x:202
        y:279
        onClicked: onOkClicked()
    }
}
