import QtQuick 2.11
import QtQuick.Controls 2.4
import "qrc:/base"
Item {
    id:login
//    visible: false
    Title{
        id:loginTitle
        width: login.width
        height: login.height*0.1
        anchors.top: login.top
        title:"Login"

    }


    InputBox{
        id:account
        width:0.9*login.width
        height:0.1*login.height
        anchors.top:login.top
        anchors.topMargin: 0.2*login.height
        anchors.left: login.left
        anchors.leftMargin: 0.09*login.width
        text:"Account"


    }
    InputBox{
        id:password
        width:0.9*login.width
        height:0.1*login.height
        anchors.top:account.bottom
        anchors.topMargin: 0.02*password.height
        anchors.left: login.left
        anchors.leftMargin: 0.09*login.width
        text:"PassWord"

    }

    Button{
        id:loginButton
        anchors.left: password.left
        anchors.leftMargin: account.width*0.1
        anchors.top: password.bottom
        anchors.topMargin: password.height*0.6

        Text {

            text: qsTr("Login")
            anchors.centerIn: parent
        }
    }
    Button{
        id:registerButton
        anchors.left: loginButton.right
        anchors.leftMargin: 0.2*password.width
        anchors.top: password.bottom
        anchors.topMargin:password.height*0.6

        Text {

            text: qsTr("Register")
            anchors.centerIn: parent

        }
    }

}
