import QtQuick 2.0

Item {
    id:message
    property  alias title: title1.text
    Rectangle{
        id:name
        width:message.width*0.96
        height: message.height*0.6
        anchors.top:message.top
        anchors.left:message .left
        border.color: "wheat"
        color: "lightyellow"
        radius: 0.1*message.height

    }
    Rectangle{
        id:title
        width: message.width *0.09
        height: message.height*0.2
        anchors.left: message.left
        anchors.leftMargin: name.width*0.04
        anchors.top: name.top
        anchors.topMargin:name.height*0.3
        Text {
            id:title1
            anchors.left: parent.left
            anchors.leftMargin: parent.height*0.01
            font.pixelSize:14
            color: "grey"

        }
    }

    Rectangle{
        id:inputBox
        clip: true
        width: 0.7*name.width
        height:0.85*name.height
        anchors.left:title.right
        anchors.leftMargin:0.05*name.width
        anchors.top: name.top
        anchors.topMargin: 0.03*name.height
        TextInput{
            id:inputText
            anchors.fill: inputBox
            font.pixelSize: Math.pow(height,0.8)
            verticalAlignment: TextInput.AlignVCenter
       }
    }
}
