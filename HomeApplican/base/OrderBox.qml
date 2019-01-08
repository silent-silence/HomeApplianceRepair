import QtQuick 2.0

Item {
    id:orderBox
    property alias title:title.text
    property alias introduction:introduction.text
    Rectangle{
        id:order
        width: orderBox.width
        height:orderBox.height
        Rectangle{
            id:textBoard
            width: 0.98*parent.width
            height: 0.98*parent.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "lightyellow"
            radius: 0.1*height
        }
        Text{
            id:title
            width: 0.9*textBoard.width
            height: 0.5*textBoard.height
                anchors.top:textBoard.top
                anchors.horizontalCenter: textBoard.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 0.2*textBoard.height
                textFormat: Text.RichText
                wrapMode: Text.Wrap
            }
            Text{
                id:introduction
                clip: true
                width: 0.9*textBoard.width
                height: 0.5*textBoard.height
                anchors.bottom: textBoard.bottom
                anchors.horizontalCenter: textBoard.horizontalCenter

                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 0.1*textBoard.height
                wrapMode: Text.Wrap
            }
        }
        MouseArea{
            id:mouseArea
            anchors.fill:order
//            onClicked:
        }
}
