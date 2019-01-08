import QtQuick 2.11
import QtQuick.Controls 2.4
import "qrc:/base"
Item {
    id:editorOrder
    visible: false
    Title{
        id:editorOrderTitle
        width: editorOrder.width
        height: editorOrder.height*0.05
        anchors.top: editorOrder.top
        title:"编辑订单"
        Text {
            id: returnButton
            anchors.top:editorOrderTitle.top
            anchors.topMargin:editorOrder.width*0.01
            anchors.left: editorOrderTitle.left
            anchors.leftMargin: editorOrder.width*0.01
            text: qsTr("返回")
            font.pixelSize: 10
            color: "grey"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    home.visible=true
                    editorOrder.visible=false
                    /*editorOrder.clicked()*/
            }
            }
        }
    }
    Rectangle{
        id:address
        width:editorOrder.width*0.96
        height: editorOrder.height*0.2
        border.color: "wheat"
        color: "lightyellow"
        opacity: 0.5
        anchors.top: editorOrderTitle.bottom
        anchors.topMargin:editorOrder.width*0.02
        anchors.horizontalCenter: editorOrder.horizontalCenter
        radius: 0.05*editorOrder.height
        Text{
            text:"添加地址"
            anchors.centerIn: parent
            font.pixelSize: 14
        }
        MouseArea{
            anchors.fill:parent
        }
    }
    Rectangle{
        id:problem
        width: editorOrder.width*0.96
        height: editorOrder.height*0.3
        anchors.top:address.bottom
        anchors.topMargin:editorOrder.height*0.02
        anchors.horizontalCenter: editorOrder.horizontalCenter
        border.color: "wheat"
        color: "lightyellow"
        radius:  0.03*editorOrder.height
        Text {
            id: title
            text: qsTr("问题描述:")
            anchors.top: parent.top
            anchors.topMargin:editorOrder.height*0.01
            anchors.left: parent.left
            anchors.leftMargin: editorOrder.height*0.01
            color: "grey"
        }
        Rectangle{
            id:problemBox
            width: 0.9*parent.width
            height: 0.8*parent.height
            anchors.top: title.bottom
            anchors.topMargin:editorOrder.height*0.01
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "wheat"
            clip: true
            TextEdit{
                anchors.fill: problemBox
                font.pixelSize:18
                horizontalAlignment: TextEdit.AlignLeft
                wrapMode: TextEdit.Wrap//自动换行
                color: "grey"

            }

        }
    }
    Rectangle{
        id:price
        width: editorOrder.width*0.96
        height: editorOrder.height*0.2
        anchors.top:problem.bottom
        anchors.topMargin:editorOrder.height*0.04
        anchors.horizontalCenter: editorOrder.horizontalCenter
        radius: 0.03*editorOrder.height
        color: "lightyellow"
        border.color: "wheat"
        Text{
            id:label
            text: "预期价格:"
            anchors.top:parent.top
            anchors.topMargin:editorOrder.height*0.03
            anchors.left: parent.left
            anchors.leftMargin:  editorOrder.height*0.02
            font.pixelSize: 14
            color:"grey"
        }
        Rectangle{
            id:minPrice
            width: editorOrder.width*0.2
            height: editorOrder.height*0.05
            anchors.top:parent.top
            anchors.topMargin:  editorOrder.height*0.02
            anchors.left: label.right
            anchors.leftMargin:  editorOrder.height*0.02
            border.color: "wheat"
            opacity: 0.5
            radius: 0.02*editorOrder.height

        }

        Rectangle{
            id:maxPrice
            width:editorOrder.width*0.2
            height:editorOrder.height*0.05
            anchors.top:parent.top
            anchors.topMargin:editorOrder.height*0.02
            anchors.left:minPrice.right
            anchors.leftMargin:editorOrder.height*0.02
            border.color: "wheat"
            opacity: 0.5
            radius: 0.02*editorOrder.height
        }

        Rectangle{
            id:inputBox
            clip: true
            width: minPrice.width*0.8
            height:minPrice.height*0.85
            anchors.centerIn: minPrice
            Text {
                id: min
                anchors.centerIn: parent
                text:"min"
                opacity: 0.5
            }
            TextInput{
                id:inputText
                anchors.fill: inputBox
                font.pixelSize: Math.pow(height,0.8)
                verticalAlignment: TextInput.AlignVCenter

            }
        }
        Rectangle{
            id:inputBox1
            clip: true
            width: maxPrice.width*0.8
            height:maxPrice.height*0.85
            anchors.centerIn: maxPrice
            Text {
                id: max
                anchors.centerIn: parent
                text:"max"
                opacity: 0.5
            }
            TextInput{
                id:inputText1
                anchors.fill: inputBox1
                font.pixelSize: Math.pow(height,0.8)
                verticalAlignment: TextInput.AlignVCenter
            }
        }
        InputBox{
            id:date
            width: parent.width*0.96
            height: parent.height*0.4
            anchors.top: label.bottom
            anchors.topMargin: 0.02*editorOrder.height
            anchors.left: label.left
            text:"上门时间："
        }
    }



    Rectangle{
        id:pushOrder
        width:editorOrder.width*0.95
        height: editorOrder.height*0.05
        anchors.bottom:editorOrder.bottom
        anchors.horizontalCenter: editorOrder.horizontalCenter
        color:"lightcyan"
        radius: 0.2*editorOrder.height
        Text {
            id: name
            text: qsTr("提交订单")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:pushOrder
        onClicked: {

           creatOrder.visible=true
        editorOrder.visible=false }
        }

    }

}
