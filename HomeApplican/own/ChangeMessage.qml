import QtQuick 2.11
import "qrc:/base"
Item {
    id:changeMessage
//    visible: false

    Title{
        id:changeMessageTitle
        width: changeMessage.width
        height: changeMessage.height*0.1
        anchors.top: changeMessage.top
        title:"ChangeMessage"

    }

    Rectangle {
        id: img
        width:changeMessage.width*0.2
        height: changeMessage.width*0.2
        radius: width/2
        border.color: "black"
        anchors.top: changeMessageTitle.bottom
        anchors.topMargin: changeMessage.width*0.02
        anchors.left:changeMessage.left
        anchors.leftMargin:changeMessage.width*0.4
        border.width: 0.02*height
        BorderImage {
            id: img1
            source: "qrc:/img/bg.png"
            anchors.fill: img
            width: img.width
            height: img.height
     }


    }
    Text{
        id:id
        text:"id:"
        anchors.top: img.bottom
        anchors.margins: changeMessage.width*0.02
        anchors.left: img.left
        opacity: 0.5
    }

    MessageBox{
        id:name
        width:changeMessage.width
        height:0.1*changeMessage.height
        anchors.top:id.bottom
        anchors.topMargin: 0.08*changeMessage.height
        anchors.left: changeMessage.left
        title:"name:"
    }
    MessageBox{
        id:address
        width:changeMessage.width
        height:0.1*changeMessage.height
        anchors.top:name.bottom
        anchors.topMargin: 0.08*changeMessage.height
        anchors.left: changeMessage.left
        title:"address:"
    }



}
