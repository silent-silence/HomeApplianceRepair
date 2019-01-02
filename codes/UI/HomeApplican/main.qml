import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4

Window {
    id:root
    visible: true
    width: Screen.desktopAvailableHeight/16*9
    height: Screen.desktopAvailableHeight
    Login{
        id:login
        width:root.width
        height:root.width
        anchors.top:root.top
        anchors.topMargin: 0.01*root.height

    }
    ChangeMessage{
        id:message
        width:root.width
        height:root.height

    }
    Register{
        id:register
        width:root.width
        height:root.height


    }

}
