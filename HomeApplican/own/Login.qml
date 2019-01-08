import QtQuick 2.11
import QtQuick.Controls 2.6
import "qrc:/base"
Item {
    id:login
    visible: false
    Title{
        id:loginTitle
        width: login.width
        height: login.height*0.05
        anchors.top: login.top
        title:"登录"
    }

    InputBox{
        id:account
        width:0.94*login.width
        height:0.09*login.height
        anchors.top:login.top
        anchors.topMargin: 0.3*login.height
        anchors.horizontalCenter: login.horizontalCenter
        text:"邮箱"

    }
    InputBox{
        id:password
        width:0.94*login.width
        height:0.09*login.height
        anchors.top:account.bottom
        anchors.topMargin: 0.02*password.height
        anchors.horizontalCenter: login.horizontalCenter
        text:"验证码"
        inputBox:0.42*password.width
            Text {
                anchors.right: password.right
                anchors.rightMargin: account.width*0.2
                anchors.top: password.top
                anchors.topMargin: password.height*0.2
                text: qsTr("获取验证码")
                font.pixelSize: 12
                MouseArea{
                    anchors.fill:parent
                }
            }


    }
    Rectangle{
        id:loginButton
        width:0.5*login.width
        height: 0.06*login.height
        anchors.top:password.bottom
        anchors.topMargin: 0.05*login.height
        anchors.horizontalCenter: login.horizontalCenter
        radius: 0.1*login.height
        color: "aquamarine"
        Text {
            anchors.centerIn: parent
            text: qsTr("登录")
            color: "white"

        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                home.visible=true
                login.visible=false
            }
        }
    }


}
