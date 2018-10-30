#include "modules/downloadUpload/presenter/downloadUpload.h"
#include "modules/downloadUpload/presenter/downloadUploadMacro.h"
#include "modules/utils/utils.h"

#include <QString>

using namespace std;

downloadUpload::downloadUpload(QObject* parent)
    : mTimer(new QTimer(this))
    , im(InfoManager::ins())
{
}

void downloadUpload::updateNetworkBar()
{
    static quint64 l_RXbytes = im->getRXbytes();
    static quint64 l_TXbytes = im->getTXbytes();
    static quint64 max_RXbytes = 1L << 20; // 1 MEBI
    static quint64 max_TXbytes = 1L << 20; // 1 MEBI

    quint64 RXbytes = im->getRXbytes();
    quint64 TXbytes = im->getTXbytes();

    quint64 d_RXbytes = (RXbytes - l_RXbytes);
    quint64 d_TXbytes = (TXbytes - l_TXbytes);

    QString downText = FormatUtil::formatBytes(d_RXbytes);
    QString upText = FormatUtil::formatBytes(d_TXbytes);

    int downPercent = ((double)d_RXbytes / (double)max_RXbytes) * 100.0;
    int upPercent = ((double)d_TXbytes / (double)max_TXbytes) * 100.0;

    //    mDownloadBar->setValue(downPercent,
    //        QString("%1/s").arg(downText),
    //        tr("Total: %1").arg(FormatUtil::formatBytes(RXbytes)));

    //    mUploadBar->setValue(upPercent,
    //        QString("%1/s").arg(upText),
    //        tr("Total: %1").arg(FormatUtil::formatBytes(TXbytes)));

    max_RXbytes = qMax(max_RXbytes, d_RXbytes);
    max_TXbytes = qMax(max_TXbytes, d_TXbytes);

    l_RXbytes = RXbytes;
    l_TXbytes = TXbytes;
}
