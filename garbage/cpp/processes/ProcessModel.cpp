#include "modules/model/processes/ProcessModel.h"

Processes::Processes(const QString& pID, const QString& usreName, const QString& pName, const QString& pCpu, const QString& pMem, const QString& rss)
    : m_pID(pID)
    , m_userName(usreName)
    , m_pName(pName)
    , m_pCpu(pCpu)
    , m_pMem(pMem)
    , m_rss(rss)
{
}

QString Processes::pID() const
{
    return m_pID;
}

QString Processes::usreName() const
{
    return m_userName;
}

QString Processes::pName() const
{
    return m_pName;
}

QString Processes::pCpu() const
{
    return m_pCpu;
}

QString Processes::pMem() const
{
    return m_pMem;
}

QString Processes::rss() const
{
    return m_rss;
}

ProcessesModel::ProcessesModel(QObject* parent)
    : QAbstractListModel(parent)
{
}

void ProcessesModel::addProcess(const Processes& proc)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_processes << proc;
    endInsertRows();
}

int ProcessesModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);
    return m_processes.count();
}

QVariant ProcessesModel::data(const QModelIndex& index, int role) const
{
    if (index.row() < 0 || index.row() >= m_processes.count())
        return QVariant();

    const Processes& proc = m_processes[index.row()];
    if (role == pIDRole)
        return proc.pID();
    else if (role == userNameRole)
        return proc.usreName();
    else if (role == pNameRole)
        return proc.pName();
    else if (role == pCpuRole)
        return proc.pCpu();
    else if (role == pMemRole)
        return proc.pMem();
    else if (role == rssRole)
        return proc.rss();
    return QVariant();
}

QHash<int, QByteArray> ProcessesModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[pIDRole] = "pID";
    roles[userNameRole] = "userName";
    roles[pNameRole] = "pName";
    roles[pCpuRole] = "pCpu";
    roles[pMemRole] = "pMem";
    roles[rssRole] = "rss";
    return roles;
}
