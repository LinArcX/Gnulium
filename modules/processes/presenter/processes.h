#ifndef PROCESSES_H
#define PROCESSES_H

#include "modules/managers/info_manager.h"
#include "modules/utils/macros/PropertyHelper.h"

#include <QObject>
#include <QString>
#include <QTimer>
#include <QVariantList>

class Processes : public QObject {
    Q_OBJECT
    Q_PROPERTY(int num READ num WRITE setNum NOTIFY numChanged)
    //    Q_PROPERTY(ProcessModel proc READ proc WRITE setProc NOTIFY procChanged)

public:
    explicit Processes(QObject* parent = nullptr);
    Q_INVOKABLE void execProc();

    void loadProcesses();

    void setNum(int num)
    {
        m_num = num;
        emit numChanged();
    }

    int num() const
    {
        return m_num;
    }

    //    void setProc(ProcessModel proc)
    //    {
    //        m_proc = proc;
    //        emit procChanged();
    //    }

    //    ProcessModel proc() const
    //    {
    //        return m_proc;
    //    }

public slots:

signals:
    void modelReady(QVariantList model);
    void singleModelReady(QVariant singleModel);
    void numChanged();
    void procChanged();

private:
    InfoManager* im;
    QTimer* mTimer;
    int m_num;
    ProcessModel m_proc;
};

#endif // PROCESSES_H
