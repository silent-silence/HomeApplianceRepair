import QtQuick 2.11

Item {
     id:orderBar
     visible: false
     ListView{
         id:listView
         anchors.fill:orderBar
         clip: true
         //interactive: false
         model:listModel
         spacing:0.01*resultBar.width
         delegate: OrderBox{
               width: listView.width
               height: listView.height

         }
         }


}
