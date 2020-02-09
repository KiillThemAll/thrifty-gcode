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
    void generateStitches(int rows, int columns,float stitchHeight, float stitchWidth);
};

#endif // GCODEGENERATOR_H
