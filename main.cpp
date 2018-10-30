#include "modules/dispatcher/dispatcher.h"
#include <QApplication>
#include <stdio.h>
//#include <pci/header.h>
#include "libs/linux/libPci/include/pci/pci.h"

//#include <proc/alloc.h>
//#include <proc/procps.h>
//#include <proc/readproc.h>
//#include <proc/sig.h>
//#include <proc/sysinfo.h>
//#include <proc/version.h>
//#include <proc/wchan.h>

// using namespace Magick;
// using namespace MagickCore;
int main(int argc, char* argv[])
{

    //    struct pci_access* pacc;
    //    struct pci_dev* dev;
    //    unsigned int c;
    //    char namebuf[1024], *name;

    //    pacc = pci_alloc(); /* Get the pci_access structure */
    //    /* Set all options you want -- here we stick with the defaults */
    //    pci_init(pacc); /* Initialize the PCI library */
    //    pci_scan_bus(pacc); /* We want to get the list of devices */
    //    for (dev = pacc->devices; dev; dev = dev->next) /* Iterate over all devices */
    //    {
    //        pci_fill_info(dev, PCI_FILL_IDENT | PCI_FILL_BASES | PCI_FILL_CLASS); /* Fill in header info we need */
    //        c = pci_read_byte(dev, PCI_INTERRUPT_PIN); /* Read config register directly */
    //        printf("%04x:%02x:%02x.%d vendor=%04x device=%04x class=%04x irq=%d (pin %d) base0=%lx",
    //            dev->domain, dev->bus, dev->dev, dev->func, dev->vendor_id, dev->device_id,
    //            dev->device_class, dev->irq, c, (long)dev->base_addr[0]);

    //        /* Look up and print the full name of the device */
    //        name = pci_lookup_name(pacc, namebuf, sizeof(namebuf), PCI_LOOKUP_DEVICE, dev->vendor_id, dev->device_id);
    //        printf(" (%s)\n", name);
    //    }
    //    pci_cleanup(pacc);

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
