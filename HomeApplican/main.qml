import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import"qrc:/own"
import"qrc:/homePage"
import"qrc:/base"
Window {
    id:root
    visible: true
    width: Screen.desktopAvailableHeight/16*9
    height: Screen.desktopAvailableHeight

    EditorOrder{
        id:editorOrder
        width:root.width
        height:root.height
        anchors.top:root.top
        anchors.left:root.left

    }
    Home{
        id:home
    }

    CreatOrder{
        id:creatOrder
        width:root.width
        height:root.height
        anchors.top:root.top
        anchors.left:root.left

    }

    Login{
        id:login
        width:root.width
        height:root.height
        anchors.top:root.top
        anchors.left:root.left
    }
    StackView{
        id:sv
        width: root.width
        height: root.height
        anchors.fill:root
        initialItem: home

    }
}
