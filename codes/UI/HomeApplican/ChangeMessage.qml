import QtQuick 2.0
import "qrc:/base"
Item {
    id:changeMessage
    visible: false

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
//            border.left: 5; border.top: 5
//            border.right: 5; border.bottom: 5
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

//    Rectangle{
//        id:name
//        clip: true
//        width:changeMessage.width+2
//        height: changeMessage.height*0.09
//        anchors.top:id.bottom
//        anchors.topMargin: 0.02*changeMessage.height
//        anchors.left: changeMessage.left
//        anchors.leftMargin: -1
//        border.color: "grey"
//        Text {
//            id:title1
//            text: qsTr("name:")
//            anchors.left: name.left
//            anchors.margins: name.height*0.1
//            anchors.top: name.top
//            anchors.topMargin:name.height*0.1
//            font.pixelSize:20

//        }
//        TextInput {
//            id:eaccount
//            width: name.width*0.9
//            height: name.height
//            anchors.left: title1.right
//            anchors.leftMargin:name.height*0.02
//            anchors.top:name.top
//            anchors.topMargin:name.height*0.2
//            font.pixelSize: 20
//            horizontalAlignment: Text.AlignHCenter

//        }
//    }
//    Rectangle{
//        id:inputBox1
//        clip: true
//        width: 0.88*name.width
//        height: 0.8*name.height
//        anchors.left: name.left
//        anchors.leftMargin: 0.02*name.width
//        anchors.top: name.top
//        anchors.topMargin: 0.02*name.width
//        TextInput{
//            id:inputText
//            anchors.fill: inputBox1
//            font.pixelSize: Math.pow(height,0.8)
//            verticalAlignment: TextInput.AlignVCenter
//        }
//    }
//    Rectangle{
//        id:address
//        clip: true
//        width:changeMessage.width+2
//        height: changeMessage.height*0.09
//        anchors.top:name.bottom
//        anchors.topMargin: 0.02*changeMessage.height
//        anchors.left: changeMessage.left
//        anchors.leftMargin: -1
//        border.color: "grey"
//        Text {
//            id:title2
//            text: qsTr("address:")
//            anchors.left: address.left
//            anchors.margins: name.height*0.1
//            anchors.top: name.bottom
//            anchors.topMargin:name.height*0.1
//            font.pixelSize:20

//        }
//        TextInput {
//            id:input_address
//            width: name.width*0.9
//            height: name.height
//            anchors.left: title2.right
//            anchors.leftMargin:name.height*0.02
//            anchors.top:address.top
//            anchors.topMargin:name.height*0.02
//            font.pixelSize: 20
//            horizontalAlignment: Text.AlignHCenter

//        }
//    }

//        InputBox{
//            id:name
//            width:0.9*changeMessage.width
//            height:0.1*changeMessage.height
//            anchors.top:id.bottom
//            anchors.topMargin: 0.02*changeMessage.height
//            text:"name"
//        }


//        InputBox{
//            id:address
//            width:0.9*changeMessage.width
//            height:0.1*changeMessage.height
//            anchors.top:name.bottom
//            anchors.topMargin: 0.02*changeMessage.height
//            text:"address:"
//        }

}
