import QtQuick 2.0

Item {
    id:title
    property alias title: title2.text
    Rectangle{
        id:title1
        color: "azure"
        anchors.top: title.top
        width: title.width
        height: title.height
        Text {
            id:title2
//            text: qsTr("ChangeMessage")
            anchors.centerIn: title1
            font.pixelSize: 20
            color: "grey"
        }
    }
}
