//#include "modules/imageMagick/presenter/imageMagick.h"
//#include "modules/imageMagick/presenter/macros/imageMagickMacro.h"
//#include "modules/utils/utils.h"
//#include <QDebug>
//#include <QDir>
//#include <QFile>
//#include <QString>
//#include <QTextStream>

//#include <Magick++.h>
//#include <MagickWand/MagickWand.h>

//using namespace std;

//ImageMagick::ImageMagick(QObject* parent)
//{
//}

//// "/home/linarcx/Desktop/test.jpg"
//// convert -strip -interlace Plane -gaussian-blur 0.05 -quality 45% out.jpg out2.jpg
//void ImageMagick::magickFunction(QString imagePath, char* args)
//{
//    int argCount = sizeof(args) / sizeof(char);
//    MagickWand* mImage = NewMagickWand();
//    MagickReadImage(mImage, imagePath);
//    //MagickNegateImage(wand, MagickTrue); // For example, negate image

//    // Hand-off image to memory program register
//    MagickWriteImage(mImage, "img");

//    // Allocate memory for MagickCommand
//    ImageInfo* info = AcquireImageInfo();
//    ExceptionInfo* e = AcquireExceptionInfo();

//    // Execute command
//    MagickCommandGenesis(info, ConvertImageCommand, argCount, args, NULL, e);
//    mImage = DestroyMagickWand(mImage);
//}

//void ImageMagick::compressImage(QString imagePath)
//{
//    char* args[] = {
//        "convert",
//        "-strip",
//        "-interlace",
//        "Plane",
//        "-gaussian-blur",
//        "0.05",
//        "-quality",
//        "45%",
//        "img",
//        "output.jpg"
//    };
//    magickFunction(imagePath, args);
//}

//void ImageMagick::rotateImage(QString)
//{
//    char* args[] = {
//        "convert",
//        "img",
//        "-rotate",
//        "-90",
//        "output.png"
//    };
//    magickFunction(imagePath, args);
//}

//void DeCreator::crateDE(QVariantMap mVars)
//{
//    auto nameIter = mVars.find(NAME);
//    QString name = nameIter.value().toString();
//    QString oldPath;

//    QString newPath = QDir::homePath() + "/.local/share/applications/" + name + ".desktop";
//    if (getOldName() != "") {
//        oldPath = QDir::homePath() + "/.local/share/applications/" + getOldName() + ".desktop";
//    }
//    if (fileExists(oldPath)) {
//        QFile file(oldPath);
//        file.rename(newPath);
//    }

//    QFile mFile(newPath);
//    if (!mFile.open(QFile::WriteOnly | QFile::Text)) {
//        qDebug() << "could not open file tor writing.";
//        return void();
//    }

//    QTextStream out(&mFile);
//    out << "[Desktop Entry]" << endl
//        << endl;

//    for (auto iter = mVars.begin(); iter != mVars.end(); ++iter) {
//        QString mKey = iter.key();
//        if (mKey == "Exec") {
//            QString execPath = iter.value().toString().remove(0, 7).simplified();
//            out << iter.key() << "=" << execPath << endl;
//        } else if (mKey == "Icon") {
//            QString iconPath = iter.value().toString().remove(0, 7).simplified();
//            out << iter.key() << "=" << iconPath << endl;
//        } else {
//            out << mKey << "=" << iter.value().toString() << endl;
//        }
//    }

//    mFile.flush();
//    mFile.close();

//    emit updateUI();
//}
