#include "modules/dispatcher/dispatcher.h"
#include <QApplication>
#include <proc/alloc.h>
#include <proc/procps.h>
#include <proc/readproc.h>
#include <proc/sig.h>
#include <proc/sysinfo.h>
#include <proc/version.h>
#include <proc/wchan.h>

// using namespace Magick;
// using namespace MagickCore;
int main(int argc, char* argv[])
{

    //    PROCTAB* proc = openproc(PROC_FILLMEM | PROC_FILLSTAT | PROC_FILLSTATUS
    //    | PROC_FILLMEM);

    //    proc_t proc_info;
    //    memset(&proc_info, 0, sizeof(proc_info));
    //    while (readproc(proc, &proc_info) != NULL) {
    //        printf("%20s:\t%5ld\t%5lld\t%5lld\t%3d\n",
    //            proc_info.cmd, proc_info.tid,
    //            proc_info.utime, proc_info.stime, proc_info.pcpu);
    //    }
    //    closeproc(proc);

    // ConvertImageCommand()
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    Dispatcher dispatcher(app);
    //    if (dispatcher.getEngine().rootObjects().isEmpty())
    //        return -1;
    return app.exec();
}
