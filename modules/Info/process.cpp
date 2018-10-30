#include "process.h"

pid_t Process::getPid() const
{
    return pid;
}

void Process::setPid(const pid_t& value)
{
    pid = value;
}

quint64 Process::getRss() const
{
    return rss;
}

void Process::setRss(const quint64& value)
{
    rss = value;
}

double Process::getPmem() const
{
    return pmem;
}

void Process::setPmem(const double& value)
{
    pmem = value;
}

quint64 Process::getVsize() const
{
    return vsize;
}

void Process::setVsize(const quint64& value)
{
    vsize = value;
}

QString Process::getUname() const
{
    return uname;
}

void Process::setUname(const QString& value)
{
    uname = value;
}

double Process::getPcpu() const
{
    return pcpu;
}

void Process::setPcpu(const double& value)
{
    pcpu = value;
}

QString Process::getCmd() const
{
    return cmd;
}

void Process::setCmd(const QString& value)
{
    cmd = value;
}

QString Process::getStartTime() const
{
    return startTime;
}

void Process::setStartTime(const QString& value)
{
    startTime = value;
}

QString Process::getState() const
{
    return state;
}

void Process::setState(const QString& value)
{
    state = value;
}

QString Process::getGroup() const
{
    return group;
}

void Process::setGroup(const QString& value)
{
    group = value;
}

int Process::getNice() const
{
    return nice;
}

void Process::setNice(const int& value)
{
    nice = value;
}

QString Process::getCpuTime() const
{
    return cpuTime;
}

void Process::setCpuTime(const QString& value)
{
    cpuTime = value;
}

QString Process::getSession() const
{
    return session;
}

void Process::setSession(const QString& value)
{
    session = value;
}

ProcessModel::ProcessModel(QObject* parent)
    : QAbstractListModel(parent)
{
}

void ProcessModel::addProcess(const Process& proc)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_process << proc;
    endInsertRows();
}

int ProcessModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);
    return m_process.count();
}

QVariant ProcessModel::data(const QModelIndex& index, int role) const
{
    if (index.row() < 0 || index.row() >= m_process.count())
        return QVariant();

    const Process& proc = m_process[index.row()];
    if (role == pidRole)
        return proc.getPid();
    else if (role == cmdRole)
        return proc.getCmd();
    else if (role == unameRole)
        return proc.getUname();
    else if (role == pcpuRole)
        return proc.getPcpu();
    else if (role == pmemRole)
        return proc.getPmem();
    else if (role == rssRole)
        return proc.getRss();
    return QVariant();
}

QHash<int, QByteArray> ProcessModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[pidRole] = "pid";
    roles[cmdRole] = "cmd";
    roles[unameRole] = "uname";
    roles[pcpuRole] = "pcpu";
    roles[pmemRole] = "pmem";
    roles[rssRole] = "rss";
    return roles;
}
