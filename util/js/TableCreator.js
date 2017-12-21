function chop(){
    console.log("hello worldsdsdsds");
}

function createTable(listName, parentName, tableName, modelName){
    var mModel = modelName(listName, parentName);
    tableName.model = mModel;
    //mTable.height = mTable.height - mLabel.height
}

function createTwoModel(listName, parentName){
    var model = Qt.createQmlObject('import QtQuick 2.4; ListModel {}', parentName);

    for (var i = 0; i < listName.length; i++) {
        var firstValue, secondValue = "";
        for (var j = 0; j < listName[i].length; j++) {
            var node = listName[i][j];
            switch(j) {
            case 0:
                firstValue = node;
                break;
            case 1:
                secondValue = node;
                break;
            }
        }
        model.append({
                         "firstValue": firstValue,
                         "secondValue": secondValue
                     });
    }
    return model;
}

function createThreeModel(listName, parentName){
    var model = Qt.createQmlObject('import QtQuick 2.4; ListModel {}', parentName);

    for (var i = 0; i < listName.length; i++) {
        var firstValue, secondValue, thirdValue = "";
        for (var j = 0; j < listName[i].length; j++) {
            var node = listName[i][j];
            switch(j) {
            case 0:
                firstValue = node;
                break;
            case 1:
                secondValue = node;
                break;
            case 2:
                thirdValue = node;
                break;
            }
        }
        model.append({
                         "firstValue": firstValue,
                         "secondValue":JSON.stringify(secondValue),
                         "thirdValue": thirdValue
                     });
    }
    return model;
}

function createSixModel(listName, parentName){
    var model = Qt.createQmlObject('import QtQuick 2.4; ListModel {}', parentName);

    for (var i = 0; i < listName.length; i++) {
        var firstValue, secondValue, thirdValue, forthValue, fifthValue, sixthValue = "";
        for (var j = 0; j < listName[i].length; j++) {
            var node = listName[i][j];
            switch(j) {
            case 0:
                firstValue = node;
                break;
            case 1:
                secondValue = node;
                break;
            case 2:
                thirdValue = node;
                break;
            case 3:
                forthValue = node;
                break;
            case 4:
                fifthValue = node;
                break;
            case 5:
                sixthValue = node;
                break;
            }
        }
        model.append({
                         "firstValue": firstValue,
                         "secondValue": secondValue,
                         "thirdValue": thirdValue,
                         "forthValue": forthValue,
                         "fifthValue": fifthValue,
                         "sixthValue": sixthValue
                     });
    }
    return model;
}

