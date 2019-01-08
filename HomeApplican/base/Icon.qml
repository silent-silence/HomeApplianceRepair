import QtQuick 2.0
import QtQuick.Controls 2.4
Item {
    id:icon
    property alias source: home.source
    property alias label:name.text
    property alias label1:name1.text
    property int number: -1
    signal click()
    Image {
        id: home
        sourceSize.width: 0.5*icon.width
        sourceSize.height: 0.5*icon.width
        anchors.top: icon.top
        anchors.topMargin: 0.02*icon.width
        anchors.left: icon.left
        anchors.leftMargin: 0.09*icon.width


    }
    Text {
        id:name
        anchors.bottom:icon.bottom
        anchors.bottomMargin: 0.06*icon.width
        anchors.left: home.left
        anchors.leftMargin:0.08*icon.width
    }
    Text {
        id:name1
        anchors.bottom:icon.bottom
        anchors.bottomMargin: 0.01*icon.width
        anchors.left: home.left
        anchors.leftMargin:0.05*icon.width

    }
    MouseArea{
        anchors.fill:icon
        onClicked:
        {

           icon.click()

        }

    }


}

