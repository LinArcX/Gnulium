#ifndef DOWNLOADUPLOAD_H
#define DOWNLOADUPLOAD_H

#include "util/cpp/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QVariantList>

class downloadUpload : public QObject {
    Q_OBJECT

public:
    explicit downloadUpload(QObject* parent = nullptr);

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
};

#endif // DOWNLOADUPLOAD_H
