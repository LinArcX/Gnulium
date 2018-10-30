#include <QAbstractListModel>
#include <QStringList>

class Processes {
public:
    Processes(const QString& pID, const QString& usreName, const QString& pName, const QString& pCpu, const QString& pMem, const QString& rss);

    QString pID() const;
    QString usreName() const;
    QString pName() const;
    QString pCpu() const;
    QString pMem() const;
    QString rss() const;

private:
    QString m_pID;
    QString m_userName;
    QString m_pName;
    QString m_pCpu;
    QString m_pMem;
    QString m_rss;
};

class ProcessesModel : public QAbstractListModel {
    Q_OBJECT
public:
    enum AnimalRoles {
        pIDRole = Qt::UserRole + 1,
        userNameRole,
        pNameRole,
        pCpuRole,
        pMemRole,
        rssRole
    };

    ProcessesModel(QObject* parent = nullptr);

    void addProcess(const Processes& proc);

    int rowCount(const QModelIndex& parent = QModelIndex()) const;

    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<Processes> m_processes;
};
