import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    id:inputBox
    property alias text:label.text
    property alias inputBox:inputBox1.width
    visible: true
    Rectangle{
        id:inputBar
        clip: true
        width: 0.7*inputBox.width
        height: 0.8*inputBox.height
        anchors.top:inputBox.top
        anchors.topMargin:inputBox.height*0.02
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "wheat"
        border.width: 0.02*height
        radius: 0.5*parent.width
    }
    Rectangle{
        id:inputBox1
        clip: true
        width: 0.88*inputBar.width
        height: 0.8*inputBar.height
        anchors.left: inputBar.left
        anchors.leftMargin: 0.05*inputBar.width
        anchors.top: inputBar.top
        anchors.topMargin: 0.02*inputBar.width      
        TextInput{
            id:inputText
            anchors.fill: inputBox1
            font.pixelSize: Math.pow(height,0.8)
            verticalAlignment: TextInput.AlignVCenter
        }
    }
    Text{
        id:label
        anchors.right: inputBar.left
        anchors.rightMargin: inputBar.height*0.04
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:Text.AlignVCenter
        anchors.verticalCenter: inputBar.verticalCenter
        color: "grey"

    }

}

