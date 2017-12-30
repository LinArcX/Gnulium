#include "modules/utils/utils.h"
#include <QDebug>
#include <QString>
#include <QStringList>

#include <functional>
#include <iostream>
#include <iterator>
#include <regex>

static QString DESTRUCTOR_MSG = QStringLiteral("Running the %1 destructor.");

void Utils::DestructorMsg(const QString value)
{
    qDebug() << DESTRUCTOR_MSG.arg(value);
}

void Utils::DestructorMsg(const QObject* const object)
{
    DestructorMsg(object->metaObject()->className());
}

std::regex Utils::getPattern()
{
    // ((\d)+\.?([\dkmgKGM%])*)|(\/([\w\d\-\/])*)|([a-zA-z]+ [a-zA-Z]+)|((\w+-)+\w+)|(\w+)
    // link: https://regex101.com/r/VKsGMs/1
    std::string blendedNumbers = "((\\d)+\.?([\\dkmgKGM%])*)";
    std::string dashSlashWord = "(\/([\\w\\d\-\/])*)";
    std::string distinctWord = "([a-zA-z]+ [a-zA-Z]+)";
    std::string dashWord = "((\\w+-)+\\w+)";
    std::string singleWord = "(\\w+)";
    std::string spacer = "|";

    std::regex word_regex(blendedNumbers + spacer
            + dashSlashWord + spacer
            + distinctWord + spacer
            + dashWord + spacer
            + singleWord,
        std::regex_constants::ECMAScript);

    return word_regex;
}

std::regex Utils::getSimplePattern()
{
    // select until new line: (?<=\n\n)(.*)(?=\n\n)
    // distint words with only one tab: (\S*?)(\s|$) or .+?(?=\s|$)
    // get all words: (\S*)(\s*)
    std::string distinctWords = "(\\S*)(\\s*)";

    std::regex word_regex(distinctWords, std::regex_constants::ECMAScript);
    return word_regex;
}

QStringList Utils::beautifyFirstLast(QString outPut)
{
    QStringList list = outPut.split("\n");
    list.removeFirst();
    list.removeLast();
    return list;
}

QStringList Utils::beautifyLast(QString outPut)
{
    QStringList list = outPut.split("\n");
    list.removeLast();
    return list;
}

QVariantList Utils::beautifer(QString outPut)
{
    QVariantList finalList;
    QStringList list = outPut.split("\n");
    list.removeLast();
    foreach (QString item, list) {
        QStringList splittedList = item.split("=");
        finalList.append(splittedList);
    }
    return finalList;
}

QVariantList Utils::performRegx(std::regex word_regex, QStringList list)
{
    QVariantList parent;
    foreach (QString var, list) {
        QVariantList items;
        std::string mVar = var.toUtf8().constData();

        auto words_begin = std::sregex_iterator(mVar.begin(), mVar.end(), word_regex);
        auto words_end = std::sregex_iterator();

        for (std::sregex_iterator i = words_begin; i != words_end; ++i) {
            std::smatch match = *i;
            std::string match_str = match.str();

            items << QString::fromStdString(match_str);
        }
        parent.insert(parent.size(), items);
    }
    return parent;
}
