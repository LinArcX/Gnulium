#pragma once

#include "util/cpp/PropertyHelper.h"
#include <QObject>
#include <QString>
#include <QVariantList>

class DeCreator : public QObject {
    Q_OBJECT

public:
    explicit DeCreator(QObject* parent = nullptr);
    Q_INVOKABLE void crateDE(QVariantMap);

    Q_INVOKABLE void setOldName(QString name) { oldName = name; }
    QString getOldName() { return oldName; }

private:
    QString oldName;

signals:
    void updateUI();
};
