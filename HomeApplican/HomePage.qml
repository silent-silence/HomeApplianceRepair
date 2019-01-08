import QtQuick 2.11
import QtQuick.Controls 2.4
import "qrc:/base"
import"qrc:/homePage"
Item {
    id:homePage
    visible: false
    property int number: 1
    Title{
        id:homePageTitle
        width: homePage.width
        height: homePage.height*0.2
        anchors.top:homePage.top
        SearchBar{
            id:search
            width:homePage.width
            height: homePage.height*0.1
            anchors.top:homePageTitle.top
            anchors.topMargin:  homePage.height*0.02
        }
    }

    Rectangle{
        id:orderList
        width:homePage.width*0.96
        height: homePage.height*0.68
        anchors.horizontalCenter: homePage.horizontalCenter
        anchors.top: homePageTitle.bottom
        anchors.topMargin:homePageTitle.height*0.02
        border.color: "grey"
        opacity: 0.5
        radius: 0.01*height
        Rectangle{
            id: img
            width:orderList.width*0.2
            height: orderList.width*0.2
            radius: width/2
            color: "red"
            anchors.bottom: orderList.bottom
            anchors.bottomMargin: homePage.width*0.02
            anchors.right:orderList.right
            anchors.rightMargin:homePage.width*0.02
            border.width: 0.02*height

            Rectangle{
                width:parent.height*0.6
                height:parent.height*0.08
                anchors.centerIn: parent
                color: "white"

            }
            Rectangle{
                width:parent.height*0.08
                height:parent.height*0.6
                anchors.centerIn: parent
                color: "white"

            } MouseArea{
                anchors.fill:parent
                onClicked:
                {
                    home.visible=false
                    editorOrder.visible=true
                }
            }

        }
    }
    OrderBar{
        id:orderBox
        width: parent.width
        height: parent.height
    }


}
