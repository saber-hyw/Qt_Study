#ifndef REGISTERA_H
#define REGISTERA_H
#include <QObject>

class RegisterA : public QObject
{
    Q_OBJECT
public:
    RegisterA(QObject *parnet = 0);
};

#endif // REGISTERA_H
