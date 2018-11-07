import QtQml 2.2
import QtQuick 2.6

Item {

    Loader {
        id: splashScreenLoader
        source: "qrc:/components/qml/LinArcxSplashScreen.qml"
        onLoaded: {
            mainWindowLoader.active = true
        }
    }

    Loader {
        id: mainWindowLoader
        active: false
        source: "qrc:/pages/launcher/app.qml"
        asynchronous: true
        onLoaded: {
            item.visible = true
            splashScreenLoader.item.visible = false
            splashScreenLoader.source = ""
        }
    }
}
