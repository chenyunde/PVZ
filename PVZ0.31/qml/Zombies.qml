import QtQuick 2.0
import Felgo 3.0
EntityBase {
    id:zombiesBase
    property variant zoms1: new Array
    property variant zoms2: new Array
    property variant zoms3: new Array
    property variant zoms4: new Array
    property variant zoms5: new Array
    Zombie{
        id:z1
        x:650
        line: 4
        parent: gameWindow.scene
    }

    Zombie{
        id:z2
        x:750
        line: 5
        parent: gameWindow.scene
    }
    Zombie{
        id:z3
        x:850
        line: 1
        parent: gameWindow.scene
    }
    Zombie{
        id:z4
        x:950
        line: 2
        parent: gameWindow.scene
    }
    Zombie{
        id:z5
        x:1050
        line: 3
        parent: gameWindow.scene
    }
    Zombie{
        id:z6
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z7
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z8
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z9
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z10
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z11
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z12
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z13
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z14
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z15
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z16
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z17
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z18
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z19
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z20
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z21
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z22
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z23
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z24
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }
    Zombie{
        id:z25
        x:Math.random()*(1000 + 1 - 600)+600
        line: Math.random()*5+1
        parent: gameWindow.scene
    }

    Timer{
        id:t1
        interval: 36000
        running: true
        onTriggered: {
            start1Go()
        }
    }

    Timer{
        id:t2
        interval: 72000
        running: true
        onTriggered: {
            start2Go()
        }
    }

    function start1Go(){
        zoms1.push(z1)
        for(var i = 0;i<5;i++)
            zoms1[i].startGo()
    }
    function start2Go(){
        zoms2.push(z2,z3,z4,z5,z6)
        for(var i = 0;i<5;i++)
            zoms2[i].startGo()
    }
    function start3Go(){
        zoms3.push(z11,z12,z13,z14,z15)
        for(var i = 0;i<5;i++)
            zoms3[i].startGo()
    }

    function start4Go(){
        zoms4.push(z16,z17,z18,z19,z20)
        for(var i = 0;i<5;i++)
            zoms4[i].startGo()
    }
    function start5Go(){
        zoms5.push(z21,z22,z23,z24,z25)
        for(var i = 0;i<5;i++)
            zoms5[i].startGo()
    }
}
