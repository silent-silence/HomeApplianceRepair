import QtQuick 2.0

Item {
    id:message
    property  alias title: title1.text
    Rectangle{
        id:name
        width:message.width+2
        height: message.height*0.6
        anchors.top:message.top
        anchors.left: message.left
        anchors.leftMargin: -1
        border.color: "grey"


    }
    Rectangle{
        id:title
        width: message.width *0.09
        height: message.height*0.1
        anchors.left: message.left
        anchors.leftMargin: name.width*0.04
        anchors.top: name.top
        anchors.topMargin:name.height*0.1
        Text {
            id:title1
            anchors.centerIn: parent
            font.pixelSize:18

        }
    }

    Rectangle{
        id:inputBox
        clip: true
        width: 0.88*name.width
        height:0.8*name.height
        anchors.left:title.right
        anchors.leftMargin:0.1*name.width
        anchors.top: name.top
        anchors.topMargin: 0.02*name.height
        TextInput{
            id:inputText
            anchors.fill: inputBox
            font.pixelSize: Math.pow(height,0.8)
            verticalAlignment: TextInput.AlignVCenter
        }
    }
}
