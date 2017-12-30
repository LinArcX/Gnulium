#ifndef DISPATCHER_H
#define DISPATCHER_H

#include <QApplication>
#include <QObject>
#include <QString>
#include <QProcess>

class QQmlApplicationEngine;
class QApplication;

class Dispatcher : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString appVer READ appVer CONSTANT)
public:
    explicit Dispatcher(QApplication&, QObject* parent = nullptr);
    QString appVer() const { return APP_VER; }
    QQmlApplicationEngine& getEngine() const { return mEngine; }
    QApplication& getApp() const { return mApp; }

signals:

public slots:

private:
    QQmlApplicationEngine& mEngine;
    QApplication& mApp;
};

#endif // DISPATCHER_H
