import QtQuick 2.0
import QtQuick.Controls 2.4
import "qrc:/base"

Item {
    id:creatOrder
    visible: false
    Title{
        id:creatOrderTitle
        width: creatOrder.width
        height: creatOrder.height*0.05
        anchors.top:creatOrder.top
        title:"Order"
        Text {
            id: returnButton
            anchors.top:parent.top
            anchors.topMargin:creatOrder.width*0.01
            anchors.left: parent.left
            anchors.leftMargin: creatOrder.width*0.01
            text: qsTr("返回")
            font.pixelSize: 10
            color: "grey"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    home.visible=true
                    creatOrder.visible=false
                }
            }
        }
    }
    Rectangle{
        id:address
        width:creatOrder.width*0.96
        height: creatOrder.height*0.2
        border.color: "wheat"
        color: "lightyellow"
        opacity: 0.5
        anchors.top: creatOrderTitle.bottom
        anchors.topMargin:creatOrder.width*0.02
        anchors.horizontalCenter: creatOrder.horizontalCenter
        radius: 0.05*creatOrder.height
        Text{
            text:"地址"
            anchors.centerIn: parent
            font.pixelSize: 14
        }

    }
    Rectangle{
        id:message
        width:creatOrder.width*0.96
        height: creatOrder.height*0.5
        border.color:"wheat"
        color: "lightyellow"
        opacity: 0.5
        anchors.top:address.bottom
        anchors.topMargin:creatOrder.width*0.02
        anchors.horizontalCenter: creatOrder.horizontalCenter
        radius: 0.05*creatOrder.height
        Text{
            id:message1
            text:"订单信息"
            anchors.top:message.top
            anchors.topMargin: creatOrder.height*0.02
            anchors.left: message.left
            anchors.leftMargin: creatOrder.height*0.02
            color: "black"
            font.pixelSize: 15
        }
        OrderMessageBox{
            id:id
            width:creatOrder.width*0.98
            height: creatOrder.height*0.05
            anchors.top: message1.bottom
            anchors.topMargin: creatOrder.height*0.01
            anchors.left: message.left
            anchors.leftMargin: creatOrder.height*0.019
            title: "订单编号:"
        }
        OrderMessageBox{
            id:expectPrice
            width:creatOrder.width*0.98
            height: creatOrder.height*0.05
            anchors.top: id.bottom
            anchors.left: message.left
            anchors.leftMargin: creatOrder.height*0.019
            title: "预期价格:"
        }
        OrderMessageBox{
               id:personId
               width:creatOrder.width*0.98
               height: creatOrder.height*0.05
               anchors.top: expectPrice.bottom
               anchors.left: message.left
               anchors.leftMargin: creatOrder.height*0.019
               title: "交易号:"

    }
            OrderMessageBox{
                id:creatDate
                width:creatOrder.width
                height: creatOrder.height*0.05
                anchors.top: personId.bottom
                anchors.left: message.left
                anchors.leftMargin: creatOrder.height*0.019
                title: "创建时间:"
            }
                OrderMessageBox{
                    id:payDate
                    width:creatOrder.width
                    height: creatOrder.height*0.05
                    anchors.top: creatDate.bottom
                    anchors.left: message.left
                    anchors.leftMargin: creatOrder.height*0.019
                    title: "支付时间:"
                }
                OrderMessageBox{
                    id:doneDate
                    width:creatOrder.width
                    height: creatOrder.height*0.05
                    anchors.top: payDate.bottom
                    anchors.left: message.left
                    anchors.leftMargin: creatOrder.height*0.019
                    title: "完成时间:"
                }
                    OrderMessageBox{
                        id:state
                        width:creatOrder.width
                        height: creatOrder.height*0.05
                        anchors.top: doneDate.bottom
                        anchors.left: message.left
                        anchors.leftMargin: creatOrder.height*0.019
                        title: "订单状态:"
          }


    }
    Rectangle{
        id:cancelButton
        width: parent.width*0.2
        height: parent.height*0.06
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width*0.01
        anchors.right: parent.right
        anchors.rightMargin:  parent.width*0.01
        radius: 0.01*parent.height
        color: "lightyellow"
        border.color: "wheat"
        Text {
            id: cancel
            anchors.centerIn: parent
            text: qsTr("取消订单")
        }
        MouseArea{
            anchors.fill:cancelButton
            onClicked:{
                home.visible=true
                creatOrder.visible=false
            }
        }

    }

}
