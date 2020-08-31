#ifndef GCODEGENERATOR_H
#define GCODEGENERATOR_H

#include <QObject>
#include <QFile>
#include <QTextStream>

#define BIG_STITCH_WIDTH 46
#define BIG_STITCH_HEIGHT 20
#define SMALL_STITCH_WIDTH 46
#define SMALL_STITCH_HEIGHT 12.85

class GCodeGenerator : public QObject
{
    Q_OBJECT
public:
    explicit GCodeGenerator(QObject *parent  = nullptr);

public slots:
    void generateStandardStitchesCut(float rows, float columns,float stitchHeight, float stitchWidth, float centerX, float centerY);
    void generateStandardStitchesEngrave(float rows, float columns, float stitchWidth, float stitchHeight, float centerX, float centerY, float strokeSpan = 1.5);
    void generateStandardStitches(float width, float height, bool small, bool randomCenter = false, float centerX = 0, float centerY = 0);
    void clearFile();
};

#endif // GCODEGENERATOR_H
