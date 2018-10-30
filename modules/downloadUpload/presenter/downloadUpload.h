#ifndef DOWNLOADUPLOAD_H
#define DOWNLOADUPLOAD_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QProcess>
#include <QString>
#include <QTimer>
#include <QVariantList>

class downloadUpload : public QObject {
    Q_OBJECT

public:
    explicit downloadUpload(QObject* parent = nullptr);

    void updateNetworkBar();

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);

private:
    QTimer* mTimer;
    InfoManager* im;
};

#endif // DOWNLOADUPLOAD_H
