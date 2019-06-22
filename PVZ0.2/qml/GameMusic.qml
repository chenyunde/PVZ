import QtQuick 2.7
import QtMultimedia 5.4

Video {

    //property bool bgming: true

    id: bgm
    source: "../assets/audio/Faster.mp3"
    autoPlay: true
    volume: 1
    onStopped: bgm.play()
    function switchTo(path){
        bgm.source = "../assets/audio/" + path +".mp3"
    }
    function stopBgm(){
            bgm.pause()
    }
    function continueBgm() {
            bgm.play()
    }
}
