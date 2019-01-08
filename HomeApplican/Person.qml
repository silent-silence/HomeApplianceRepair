import QtQuick 2.11
import "qrc:/base"
Item {
    id:person
    visible: false
    property int number:3
    Title{
        id:personTitle
        width:person.width
        height:(person.width>person.height)?person.height*0.5:person.height*0.3
        anchors.top: person.top
        RoundButton{
            id:img
            width:person.width*0.2
            height:person.width*0.2
            anchors.left: personTitle.left
            anchors.leftMargin: person.width*0.4
            anchors.top: personTitle.top
            anchors.topMargin: person.height*0.05
            source:"qrc:/img/bg.png"
         MouseArea{
             anchors.fill:img
             onClicked: {
                 home.visible=false
                 login.visible=true
             }
         }
        }
//        Icon{
//            id:comment
//            width: 0.1*person.width
//            height: 0.8*person.height
//            anchors.top:img.bottom
//            anchors.topMargin: 0.02*person.width
//            anchors.left: img.left
//            anchors.leftMargin: 0.02*person.width
//            source: "qrc:/img/comment.png"
//            label1: qsTr("评论")
//        }
//        Icon{
//            id:history
//            width: 0.2*orderStateList.width
//            height: 0.8*orderStateList.height
//            anchors.top: personTitle.bottom
//            anchors.topMargin: 0.02*orderStateList.width
//            anchors.left: comment.right
//            anchors.leftMargin: 0.02*orderStateList.width
//            source: "qrc:/img/comment.png"
//            label1: qsTr("足迹")
//        }
    }
    Rectangle{
        id:orderStateList
        width:person.width*0.96
        height:(person.width>person.height)?person.height*0.3:person.height*0.1
        anchors.top: personTitle.bottom
        anchors.topMargin:person.height*0.01
        anchors.horizontalCenter: person.horizontalCenter
        border.color: "wheat"
        radius: 0.01*person.height
        Icon{
                    id:allOrderList
                    width: 0.2*orderStateList.width
                    height: 0.8*orderStateList.height
                    anchors.top: orderStateList.top
                    anchors.topMargin: 0.02*orderStateList.width
                    anchors.left: orderStateList.left
                    anchors.leftMargin: 0.02*orderStateList.width
                    source: "qrc:/img/allOrder.png"
                    label1: qsTr("全部订单")
                }
                Icon{
                    id:onreceive
                    width: 0.2*orderStateList.width
                    height: 0.8*orderStateList.height
                    anchors.top: orderStateList.top
                    anchors.topMargin: 0.02*orderStateList.width
                    anchors.left: allOrderList.right
                    anchors.leftMargin: 0.015*orderStateList.width
                    source: "qrc:/img/onreceive.png"
                    label1: qsTr("待接收")
                }
                Icon{
                    id:ontoDoor
                    width: 0.2*orderStateList.width
                    height: 0.8*orderStateList.height
                    anchors.top: orderStateList.top
                    anchors.topMargin: 0.02*orderStateList.width
                    anchors.left:onreceive.right
                    anchors.leftMargin: 0.015*orderStateList.width
                    source: "qrc:/img/onTODoor.png"
                    label1: qsTr("待上门")
                }
                Icon{
                    id:onGoing
                    width: 0.2*orderStateList.width
                    height: 0.8*orderStateList.height
                    anchors.top: orderStateList.top
                    anchors.topMargin: 0.02*orderStateList.width
                    anchors.left:ontoDoor.right
                    anchors.leftMargin: 0.015*orderStateList.width
                    source: "qrc:/img/onGoing.png"
                    label1: qsTr("进行中")
                }
                Icon{
                    id:done
                    width: 0.2*orderStateList.width
                    height: 0.8*orderStateList.height
                    anchors.top: orderStateList.top
                    anchors.topMargin: 0.02*orderStateList.width
                    anchors.left:onGoing.right
                    anchors.leftMargin: 0.015*orderStateList.width
                    source: "qrc:/img/done.png"
                    label1: qsTr("已完成")
                }
    }


//        Rectangle{
//            id:re
//            width:person.width*0.96
//            height:person.height*0.3
//            border.color: "wheat"
//            anchors.top:line.bottom
//            anchors.horizontalCenter: person.horizontalCenter
//            radius: 0.01*person.height

//           Rectangle{
//               id:commentBox
//               width:parent.width*0.96
//               height:parent.height*0.3
//               anchors.top:parent.top
//               anchors.horizontalCenter: person.horizontalCenter
//               ClickBox{
//                   id:comment
//                   width: parent.width*0.96
//                   height: 0.1*parent.height
//                   anchors.top: orderStateList.bottom
//                   anchors.horizontalCenter: parent.horizontalCenter
//                   source: "qrc:/img/comment.png"
//                   text:"评论"

//               }


//        }
//        }

}
