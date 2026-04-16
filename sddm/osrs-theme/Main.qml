import QtQuick 2.15
import QtQuick.Layouts 1.15
import SddmComponents 2.0

Rectangle {
    id: container
    width: 1920
    height: 1080
    color: "black"

    // GLOBAL CONFIGURATION
    property string globalFont: "Runescape UF"
    property string rsYellow: "#ffff00"

    // 1. Animated Background
    AnimatedImage {
        id: background
        source: "assets/background.gif"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status === AnimatedImage.Ready) {
                background.paused = false
            }
        }
    }

    Rectangle {
        id: loginBox
        width: 480 
        height: 320
        anchors.centerIn: parent
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#5d5e5e" } 
            GradientStop { position: 1.0; color: "#3e3e3e" } 
        }
        
        border.color: "#2e2e2e" 
        border.width: 2

        Rectangle {
            anchors.fill: parent
            anchors.margins: 2
            color: "transparent"
            border.color: "#8a8a8a"
            border.width: 2

            Rectangle {
                anchors.fill: parent
                anchors.margins: 2
                color: "transparent"
                border.color: "black"
                border.width: 1
            }
        }

        Column {
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -5
            spacing: 10 

            Image {
                id: avatar
                width: 75; height: 75
                source: "assets/pfp.png"
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
                
                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    border.color: "#ff981f"
                    border.width: 2
                    visible: avatar.status !== Image.Ready
                }
            }

            Text {
                text: userModel.lastUser
                anchors.horizontalCenter: parent.horizontalCenter
                color: container.rsYellow
                font.family: container.globalFont
                font.pixelSize: 28
                font.bold: true
                renderType: Text.NativeRendering
                style: Text.Outline; styleColor: "black"
            }

            Column {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                
                Text {
                    text: "Enter Password"
                    color: "white"
                    font.family: container.globalFont
                    font.pixelSize: 14
                    anchors.horizontalCenter: parent.horizontalCenter
                    renderType: Text.NativeRendering
                }

                Rectangle {
                    width: 300; height: 32
                    color: "white"
                    border.color: "black"
                    border.width: 1
                    
                    TextInput {
                        id: password
                        anchors.fill: parent
                        anchors.margins: 4
                        color: "black"
                        font.family: container.globalFont
                        font.pixelSize: 20
                        echoMode: TextInput.Password
                        focus: true 
                        horizontalAlignment: TextInput.AlignHCenter
                        renderType: Text.NativeRendering
                        clip: true
                        onAccepted: sddm.login(userModel.lastUser, password.text, session.currentIndex)
                    }
                }
            }

            Rectangle {
                id: loginButton
                width: 160; height: 38
                anchors.horizontalCenter: parent.horizontalCenter
                color: loginMouse.pressed ? "#5a432d" : "#7d5a3c"
                border.color: "black"; border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: "Log In"
                    color: "white"
                    font.family: container.globalFont
                    font.pixelSize: 18
                    renderType: Text.NativeRendering
                }

                MouseArea {
                    id: loginMouse
                    anchors.fill: parent
                    onClicked: sddm.login(userModel.lastUser, password.text, session.currentIndex)
                }
            }

            Text {
                text: "Not you? Click to switch"
                color: "#bcbcbc"
                font.family: container.globalFont
                font.pixelSize: 14
                anchors.horizontalCenter: parent.horizontalCenter
                renderType: Text.NativeRendering
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: userModel.lastIndex = (userModel.lastIndex + 1) % userModel.count
                }
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 25
        width: 220; height: 40
        color: "#3e3529"
        border.color: "#5d5447"
        border.width: 2

        Text {
            anchors.centerIn: parent
            text: "World: " + sessionModel.get(session.currentIndex).name
            color: container.rsYellow
            font.family: container.globalFont
            font.pixelSize: 18
            renderType: Text.NativeRendering
        }
    }

    Item { id: session; property int currentIndex: sessionModel.lastIndex }

    Connections {
        target: sddm
        function onLoginFailed() {
            errorMessage.text = "Invalid password. Try again."
            password.text = ""
        }
    }

    Text {
        id: errorMessage
        anchors.top: loginBox.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ff4444"
        font.family: container.globalFont
        font.pixelSize: 20
        renderType: Text.NativeRendering
        text: ""
        style: Text.Outline; styleColor: "black"
    }
}
