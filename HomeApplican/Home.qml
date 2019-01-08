import QtQuick 2.0
import QtQuick.Controls 2.4
import"qrc:/base"

Item {
    id:home
    property var currentState:homePage
    HomePage{
        id:homePage

    }
    Person{
        id:own
    }
    BaseLabel{
        id:baseLabel
        width:home.width*0.96
        height:home.height*0.1
        anchors.bottom:home.bottom
        anchors.left: home.left
        anchors.leftMargin: home.width*0.02
    }
    News{
        id:news
        number:2
    }
    StackView{
        id:sv1
        width: home.width
        height: home.height
        anchors.fill:home
        initialItem: homePage

    }
    function stateChanged(num)
    {
        var change=StackView.PopTransition
        if(currentState.number<num){
            change=StackView.PushTransition
        }
        if(currentState.number!==num){
            switch(num){
            case 1:sv1.replace(currentState,homePage,change);currentState=homePage;break;
            case 2:sv1.replace(currentState,news,change);currentState=news;break;
            case 3:sv1.replace(currentState,own,change);currentState=own;break;

            }


        }
    }

}
