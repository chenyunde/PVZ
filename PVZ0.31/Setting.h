#ifndef PEOPLE_H
#define PEOPLE_H

#include <QObject>
#include <QString>
#include <QJsonObject>

class Setting : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int cla READ cla WRITE setCla NOTIFY claChanged)
    Q_PROPERTY(int level READ level WRITE setLevel NOTIFY levelChanged)
    Q_PROPERTY(bool music READ music WRITE setMusic NOTIFY musicChanged)

public:
    enum SaveFormat {
        Json, Binary
    };

    Setting();
    Setting(const QString &name,int cla,int level,bool music);

    void setName(const QString &name);
    QString name() const;

    void setCla(const int cla);
    int cla() const;

    void setLevel(const int level);
    int level() const;

    void setMusic(int music = 1);
    int music();

    void read(const QJsonObject &json);
    bool load(const SaveFormat &saveFormat);

    Q_INVOKABLE bool save();//People::SaveFormat saveFoemat
    void write( QJsonObject &json);

signals:
    void nameChanged();
    void levelChanged();
    void claChanged();
    void musicChanged();

private:
    QString mname;
    int mcla;
    int mlevel;
    int mmusic;
};

#endif // PEOPLE_H
