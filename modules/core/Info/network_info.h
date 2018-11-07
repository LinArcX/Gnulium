#ifndef NETWORK_INFO_H
#define NETWORK_INFO_H

#include "util/cpp/command_util.h"
#include "util/cpp/file_util.h"
#include <QtNetwork/QNetworkInterface>

#include "util/cpp/stacer-core_global.h"

class STACERCORESHARED_EXPORT NetworkInfo {
public:
    NetworkInfo();

    QString getDefaultNetworkInterface() const;
    QList<QNetworkInterface> getAllInterfaces();

    quint64 getRXbytes() const;
    quint64 getTXbytes() const;

private:
    QString defaultNetworkInterface;

    QString rxPath;
    QString txPath;
};

#endif // NETWORK_INFO_H
