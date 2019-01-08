import QtQuick 2.0

Item {
    id:orderMessage
    property alias title: title.text
    property alias message: message.text
   Rectangle{
       id:rt
       width: parent.width*0.96
       height: parent.height
       anchors.verticalCenter: orderMessage.verticalCenter
       opacity: 0.5
       Text {
           id: title
           anchors.verticalCenter: rt.verticalCenter
           anchors.left: parent.left
           anchors.leftMargin:  parent.height*0.05
       }
       Text{
           id:message
           anchors.top: parent.top
           anchors.topMargin: parent.height*0.05
           anchors.left:title.right
           anchors.leftMargin:  parent.height*0.05
       }
   }
}
