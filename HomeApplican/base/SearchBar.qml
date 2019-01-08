import QtQuick 2.0

Item {
    id:search
    Rectangle{
        id:inputBar
        clip: true
        width: 0.9*search.width
        height: 0.6*search.height
        anchors.centerIn: parent
        border.color: "black"
        border.width: 0.02*height
        radius: 0.3*height
        opacity: 0.2
        Image {
            id: img
            source: "qrc:/img/search.png"
            anchors.right:parent.right
            anchors.rightMargin: parent.height*0.1
            anchors.top: parent.top
            anchors.topMargin:parent.height*0.1
            sourceSize.width:parent.width*0.08
            sourceSize.height: parent.height*0.7
            MouseArea{
                anchors.fill:parent
            }
        }
    }
    Rectangle{
        id:inputBox1
        clip: true
        width: 0.88*inputBar.width
        height: 0.8*inputBar.height
        anchors.left: inputBar.left
        anchors.leftMargin: 0.01*inputBar.width
        anchors.top: inputBar.top
        anchors.topMargin: 0.01*inputBar.width
        TextInput{
            id:inputText
            anchors.fill: inputBox1
            font.pixelSize: Math.pow(height,0.8)
            verticalAlignment: TextInput.AlignVCenter
        }
    }

}
