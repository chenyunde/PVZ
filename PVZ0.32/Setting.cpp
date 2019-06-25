#include "Setting.h"
#include <QFile>
#include <QJsonDocument>

Setting::Setting(){}

Setting::Setting(const QString &name,int cla,int level,bool music):mname(name),mcla(cla),mlevel(level),mmusic(music)
{
}


void Setting::setName(const QString &name)
{
    mname = name;
}


QString Setting::name() const
{
    return mname;
}

void Setting::setCla(const int cla)
{
    mcla = cla;
}

int Setting::cla() const
{
    return mcla;
}

void Setting::setLevel(const int level){
    mlevel = level;
}
int Setting::level() const{
    return mlevel;
}

void Setting::setMusic(int music){
    mmusic = music;
}
int Setting::music(){
    return mmusic;
}


void Setting::read(const QJsonObject &json)
{
    //判断得到的json对象中是否包含相应的键，如果包含，就将其注入到数据成员中
    if(json.contains("name") && json["name"].isString())
        mname = json["name"].toString();

    if(json.contains("cla") && json["cla"].isDouble())
        mcla = json["cla"].toInt();

    if(json.contains("level") && json["level"].isDouble())
        mlevel = json["level"].toInt();

    if(json.contains("music") && json["music"].isDouble())
        mmusic = json["music"].toInt();
}


bool Setting::load(const SaveFormat &saveFormat)
{
    //导入json数据文件
    QFile loadFile(saveFormat == Json ?
                       QStringLiteral("save.json"):QStringLiteral("save.dat"));

    if(!loadFile.open(QIODevice::ReadOnly)){
        qWarning("Couldn't not open save file.");
        return false;
    }

    QByteArray saveData = loadFile.readAll();
    //将导入的数据以json文档的形式组织
    QJsonDocument loadDoc(saveFormat == Json ?
              QJsonDocument::fromJson(saveData): QJsonDocument::fromBinaryData(saveData));

    //通过文档得到这个json对象
    QJsonObject json(loadDoc.object());

    read(json); //将json对象中的数据读入类的数据成员中。
    return true;
}

void Setting::write( QJsonObject &json)
{
    json["name"] = mname;
    json["cla"] = mcla;
    json["level"] = mlevel;
    json["music"] = mmusic;
}

bool Setting::save()//People::SaveFormat saveFoemat
{
    QFile saveFile(QStringLiteral("save.json"));
    if(!saveFile.open(QIODevice::WriteOnly)){
        qWarning("Couldn't open save file.");
                 return false;
    }

    QJsonObject gameObject;
    write(gameObject);
    QJsonDocument saveDoc(gameObject);

    saveFile.write(saveDoc.toJson());

    return true;
}
