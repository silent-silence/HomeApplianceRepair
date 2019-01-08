import QtQuick 2.11
import QtGraphicalEffects 1.0

Item{
    id:roundButton
    property alias source:image.source
    Rectangle {
            id: img
            width:roundButton.width
            height: roundButton.height
            radius: width/2
            color: "black"
            Image {
                id: image
                smooth: true
                visible: false
                anchors.fill: parent
                sourceSize: Qt.size(parent.size, parent.size)
            }
            Rectangle {
                id: mask
                color: "black"
                anchors.fill: parent
                radius: width/2
                visible: false
                smooth: true
            }
            OpacityMask {
                //用maskSource对source进行遮挡
                id:mask_image
                anchors.fill: image
                source: image
                maskSource: mask
                visible: true
            }
        }
}
