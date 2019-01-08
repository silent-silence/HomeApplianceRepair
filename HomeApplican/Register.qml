import QtQuick 2.11
import QtQuick.Controls 2.4
import "qrc:/base"
Item {
    id:register
    visible: false
    Title{
        id:registerTitle
        width: register.width
        height: register.height*0.1
        anchors.top:register.top
        title:"Register"

    }
    InputBox{
        id:email
        width:0.9*register.width
        height:0.1*register.height
        anchors.top:registerTitle.bottom
        anchors.topMargin: 0.1*register.height
        anchors.left: register.left
        anchors.leftMargin: 0.09*register.width
        text:"e-mail"
    }
    InputBox{
        id:password
        width:0.9*register.width
        height:0.1*register.height
        anchors.top:email.bottom
        anchors.topMargin: 0.02*register.height
        anchors.left: register.left
        anchors.leftMargin: 0.09*register.width
        text:"password"
    }
    InputBox{
        id:insurePassword
        width:0.9*register.width
        height:0.1*register.height
        anchors.top:password.bottom
        anchors.topMargin: 0.02*register.height
        anchors.left: register.left
        anchors.leftMargin: 0.09*register.width
        text:"InsurePassword"
    }
    Button{
        id:registerButton
        anchors.left: insurePassword.left
        anchors.leftMargin: register.width*0.1
        anchors.top: insurePassword.bottom
        anchors.topMargin: password.height*0.5

        Text {

            text: qsTr("Register")
            anchors.centerIn: parent
        }
    }
    Button{
        id:cancelButton
        anchors.left: registerButton.right
        anchors.leftMargin: 0.2*password.width
        anchors.top: insurePassword.bottom
        anchors.topMargin:password.height*0.5

        Text {

            text: qsTr("Cancel")
            anchors.centerIn: parent

        }
    }


}
