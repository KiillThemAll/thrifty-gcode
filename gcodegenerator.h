#ifndef GCODEGENERATOR_H
#define GCODEGENERATOR_H

#include <QObject>
#include <QFile>
#include <QTextStream>

class GCodeGenerator : public QObject
{
    Q_OBJECT
public:
    explicit GCodeGenerator(QObject *parent  = nullptr);

public slots:
    void generateStitches(float rows, float columns,float stitchHeight, float stitchWidth, float centerX, float centerY);
    void clearFile();
};

#endif // GCODEGENERATOR_H
