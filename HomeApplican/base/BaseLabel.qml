import QtQuick 2.11
import QtQuick.Controls 2.4
Item {
    id:baseLabel
    property var currentState:homePage

    Rectangle{
        id:base
        width: baseLabel.width
        height: baseLabel.height
        border.color: "grey"
        radius: 0.05*baseLabel.height
        Icon{
            id:homePage
            width: 0.25*base.width
            height: base.height
            anchors.top: base.top
            anchors.topMargin: 0.02*base.width
            anchors.left: base.left
            anchors.leftMargin: 0.02*base.width
            source: "qrc:/img/home.png"
            label: qsTr("首页")
            number:1
            onClick: {
              if(home.opacity!==0)
                 currentState=homePage
            }

        }
        Icon{
            id:news
            width: 0.25*base.width
            height: base.height
            anchors.top: base.top
            anchors.topMargin: 0.02*base.width
            anchors.left:homePage.right
            anchors.leftMargin: 0.15*base.width
            source: "qrc:/img/news.png"
            label: qsTr("信息")
            number:2
            onClick: {
                if(home.opacity!==0)
                    currentState=news

            }
        }
        Icon{
            id:own
            width: 0.25*base.width
            height: base.height
            anchors.top: base.top
            anchors.topMargin: 0.02*base.width
            anchors.left:news.right
            anchors.leftMargin: 0.15*base.width
            source: "qrc:/img/person.png"
            label: qsTr("我的")
            number:3
            onClick: {
                if(home.opacity!==0)
                    currentState=own
            }
        }
    }
    onCurrentStateChanged: {
//        home.pop(currentState)
        home.stateChanged(currentState.number)
    }
}
