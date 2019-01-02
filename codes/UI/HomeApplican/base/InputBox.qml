import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    id:inputBox
    property alias text:label.text
    property alias inputBar:inputBar
    visible: true
    Rectangle{
        id:inputBar
        clip: true
        width: 0.7*inputBox.width
        height: 0.8*inputBox.height
        anchors.top:inputBox.top
        anchors.topMargin:inputBox.height*0.02
        anchors.left: inputBox.left
        anchors.leftMargin: inputBox.width*0.15
        border.color: "black"
        border.width: 0.02*height
        radius: 0.1*height
    }
    Rectangle{
        id:inputBox1
        clip: true
        width: 0.88*inputBar.width
        height: 0.8*inputBar.height
        anchors.left: inputBar.left
        anchors.leftMargin: 0.02*inputBar.width
        anchors.top: inputBar.top
        anchors.topMargin: 0.02*inputBar.width
        TextInput{
            id:inputText
            anchors.fill: inputBox1
            font.pixelSize: Math.pow(height,0.8)
            verticalAlignment: TextInput.AlignVCenter
        }
    }
    Label{
        id:label
        anchors.right: inputBar.left
        anchors.rightMargin: inputBar.width*0.02
//        text:"Account:"
        font.pixelSize: 11
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: inputBar.verticalCenter

    }

}

