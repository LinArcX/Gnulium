import QtQuick 2.9
import QtQuick.Controls 2.2
import QtCharts 2.2
import linarcx.gnulium.histogram 1.0

import "qrc:/components/qml"
import "qrc:/strings/CoreStrings.js" as CStr
import "qrc:/strings/HistogramStrings.js" as Str

Row {
    id: mHistogramContent
    spacing: CStr.rowSpacing
    anchors.fill: parent

    Histogram {
        id: mHistogram
    }

    HistogramPillar {
        width: parent.width / 5 * 1
        height: parent.height
    }

    SpacerVertical {
    }

    Rectangle {
        width: parent.width / 5 * 4 - (CStr.tabViewMargin)
        height: parent.height
        color: CStr.transparent

        ChartView {
            id: mChart
            title: "Bash History Graph"
            anchors.fill: parent
            legend.alignment: Qt.AlignBottom
            animationOptions: ChartView.SeriesAnimations
            //antialiasing: true
            //theme: ChartView.ChartThemeQt
            //animationEasingCurve:
            //dropShadowEnabled: true
        }

        Connections {
            target: mHistogram
            onModelReady: {
                var counter = []
                var command = []
                for (var i = 0; i < model.length; i++) {
                    var firstRole, secondRole = ""
                    for (var j = 0; j < model[i].length; j++) {
                        var node = model[i][j]
                        switch (j) {
                        case 0:
                            counter.push(node)
                            break
                        case 1:
                            command.push(node)
                            break
                        }
                    }
                }

                var mHorSeries = mChart.createSeries(
                            ChartView.SeriesTypeHorizontalBar)

                var categoryAxisY = Qt.createQmlObject(
                            'import QtCharts 2.2;BarCategoryAxis {}', mChart)
                mHorSeries.axisY = categoryAxisY
                mHorSeries.labelsVisible = true

                categoryAxisY.categories = command

                var mBarSet = mHorSeries.append("commands", counter)
                mBarSet.color = "#2196F3"

                //mBarSet.labelColor = "green"
                mChart.axisX(mHorSeries).min = 0
                mChart.axisX(mHorSeries).max = Math.max.apply(null,
                                                              mBarSet.values)
            }
        }

        Component.onCompleted: {
            mHistogram.execHistogram()
        }
    }
}
