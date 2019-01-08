import QtQuick 2.0
import "qrc:/base"
Item {
    id:addAddress
    Title{
        id:addAddressTitle
        width: addAddress.width
        height: addAddress.height*0.1
        anchors.top: addAddress.top
        title:"AddAddress"

    }
      MessageBox{
          id:name
          width:addAddress.width
          height:0.1*addAddress.height
          anchors.top:addAddressTitle.bottom
          anchors.topMargin: 0.08*addAddress.height
          anchors.left: addAddress.left
          title:"Name:"

      }
      MessageBox{
          id:tel
          width:addAddress.width
          height:0.1*addAddress.height
          anchors.top:name.bottom
          anchors.topMargin: 0.08*addAddress.height
          anchors.left: addAddress.left
          title:"Tel:"

      }
      MessageBox{
          id:address
          width:addAddress.width
          height:0.1*addAddress.height
          anchors.top:tel.bottom
          anchors.topMargin: 0.08*addAddress.height
          anchors.left: addAddress.left
          title:"Address:"

      }


}
