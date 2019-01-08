import QtQuick 2.0

Item {
    id:clickBox
    property alias text:name.text
    property alias source: comment.source
    Rectangle{
        id:commentBox
        width:parent.width
        height:parent.height
        anchors.top:parent.top
        anchors.horizontalCenter: person.horizontalCenter
        border.color: "wheat"
        radius: 0.1*parent.height
        Icon{
            id:comment
            width: 0.2*parent.width
            height: 0.6*parent.height
            anchors.top: parent.top
            anchors.topMargin: 0.02*parent.width
            anchors.left:parent.left
            anchors.leftMargin: 0.015*parent.width

        }
        Text{
            id:name
            anchors.top: parent.top
            anchors.topMargin: 0.02*parent.width
            anchors.left:comment.left
            anchors.leftMargin: 0.2*parent.width
            font.pixelSize:20
        }
    }
    Icon{
        id:icon
        width: 0.2*parent.width
        height: 0.3*parent.height
        anchors.top: parent.top
        anchors.topMargin: 0.02*parent.width
        anchors.right:commentBox.right
//        anchors.rightMargin: 0.005*parent.width
        source:"qrc:/img/jiantou.png"


    }

 }

