import QtQuick 2.0
import QtQuick.Controls 2.4
import "qrc:/base"
Item {
    id:news
    visible: false
    property int number:2
    Title{
        id:newsTitle
        width: news.width
        height: news.height*0.05
        anchors.top:news.top
        title: "消息"

    }
    Rectangle{
        id:newsBox
        width:news.width*0.96
        height:news.height*0.75
        anchors.top:newsTitle.bottom
        anchors.topMargin: news.height*0.02
        anchors.horizontalCenter: news.horizontalCenter
        border.color: "wheat"
        radius: 0.01*news.height
    }

}
