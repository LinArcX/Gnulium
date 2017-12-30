#ifndef HISTOGRAM_H
#define HISTOGRAM_H

#include "modules/utils/macros/PropertyHelper.h"
#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

class Histogram : public QObject {
    Q_OBJECT

public:
    explicit Histogram(QObject* parent = nullptr);

    QProcess* pHistogram;
    void returnHistogram();
    Q_INVOKABLE void execHistogram();

    void returnStandardError();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};

#endif // HISTOGRAM_H
