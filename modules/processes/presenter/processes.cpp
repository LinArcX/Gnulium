#include "modules/processes/presenter/processes.h"
#include "modules/dispatcher/dispatcher.h"
#include "modules/utils/utils.h"

#include <QString>
#include <cstdlib>

using namespace std;

Processes::Processes(QObject* parent)
    : im(InfoManager::ins())
    , mTimer(new QTimer(this))
{
}

void Processes::execProc()
{
    loadProcesses();
    connect(mTimer, &QTimer::timeout, this, &Processes::loadProcesses);
    mTimer->setInterval(1000);
    mTimer->start();
}

void Processes::loadProcesses()
{
    im->updateProcesses();
    QList<Process> pList = im->getProcesses();
    QList<Process> pListFinal;

    QString username = im->getUserName();

    if (false) {
        for (const Process& proc : pList) {
            pListFinal.append(proc);
        }
    } else {
        for (const Process& proc : pList) {
            if (username == proc.getUname()) {
                pListFinal.append(proc);
            }
        }
    }

    ProcessModel* model = new ProcessModel(this);
    for (int i = 0; i < pListFinal.length(); i++) {
        Process p;
        p.setPid(pList[i].getPid());
        p.setCmd(pList[i].getCmd());
        p.setUname(pList[i].getUname());
        p.setPcpu(pList[i].getPcpu());
        p.setPmem(pList[i].getPmem());
        p.setRss(pList[i].getRss());
        model->addProcess(p);
    }

    int number = 2;
    int randomValue = qrand() * number;

    setNum(randomValue);
    qDebug() << randomValue;

    //Dispatcher::getContext()->setContextProperty("processesModel", randomValue);
}
