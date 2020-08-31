#include "gcodegenerator.h"

GCodeGenerator::GCodeGenerator(QObject *parent) : QObject(parent)
{
    QFile stitchesGCode("stitchesGCode.ngc");
    stitchesGCode.open(QFile::WriteOnly | QFile::Truncate);
}

void GCodeGenerator::generateStandardStitchesCut( float columns, float rows, float stitchWidth, float stitchHeight, float centerX, float centerY)
{
    QFile stitchesGCode("cutStitchesGCode.ngc");
    if (stitchesGCode.open(QFile::WriteOnly | QFile::Append)) {
        QTextStream out(&stitchesGCode);

        float lbX = centerX - columns*stitchWidth/2;
        float lbY = centerY - rows*stitchHeight/2;

        out << "M220 S100\nG0 F10000\n";

        out <<  QString("G90 G0 X%1 Y%2 F10000\n").arg(lbX,0,'f',4).arg(lbY,0,'f',4);

        out << "G0 F1500\nG1 F1500\n";

        for (int i=0; i<=rows; i++)
        {
            out << QString("G0 Y%1\n").arg(lbY+stitchHeight*i,0,'f',4);

            for (int j=0; j<columns; j++)
                if (!(i%2))
                    out << QString("G1 X%1\nG0 X%2\nG1 X%3\n")
                           .arg(lbX+j*stitchWidth+stitchWidth/2,0,'f',4)
                           .arg(lbX+j*stitchWidth+stitchWidth/2+0.25,0,'f',4)
                           .arg(lbX+j*stitchWidth+stitchWidth,0,'f',4);
                else
                    out << QString("G1 X%1\nG0 X%2\nG1 X%3\n")
                           .arg(lbX+columns*stitchWidth-j*stitchWidth-stitchWidth/2,0,'f',4)
                           .arg(lbX+columns*stitchWidth-j*stitchWidth-stitchWidth/2-0.25,0,'f',4)
                           .arg(lbX+columns*stitchWidth-j*stitchWidth-stitchWidth,0,'f',4);
        }

        out <<  QString("G90 G0 X%1 Y%2 F10000\n").arg(lbX,0,'f',4).arg(lbY,0,'f',4);

        for (int i=0; i<=columns; i++)
        {
            out << QString("G0 X%1\n").arg(lbX+stitchWidth*i,0,'f',4);

            for (int j=0; j<rows; j++)
                if (!(i%2))
                    out << QString("G1 Y%1\nG0 Y%2\nG1 Y%3\n")
                           .arg(lbY+j*stitchHeight+stitchHeight/2,0,'f',4)
                           .arg(lbY+j*stitchHeight+stitchHeight/2+0.25,0,'f',4)
                           .arg(lbY+j*stitchHeight+stitchHeight,0,'f',4);
                else
                    out << QString("G1 Y%1\nG0 Y%2\nG1 Y%3\n")
                           .arg(lbY+rows*stitchHeight-j*stitchHeight-stitchHeight/2,0,'f',4)
                           .arg(lbY+rows*stitchHeight-j*stitchHeight-stitchHeight/2-0.25,0,'f',4)
                           .arg(lbY+rows*stitchHeight-j*stitchHeight-stitchHeight,0,'f',4);
        }
    }
}

void GCodeGenerator::generateStandardStitchesEngrave( float columns, float rows, float stitchWidth, float stitchHeight, float centerX, float centerY, float strokeSpan)
{
    QFile stitchesGCode("engraveStitchesGCode.ngc");
    if (stitchesGCode.open(QFile::WriteOnly | QFile::Append)) {
        QTextStream out(&stitchesGCode);

        float lbX = centerX - columns*stitchWidth/2;
        float lbY = centerY - rows*stitchHeight/2;

        int strokeCount = (stitchHeight - 2) / strokeSpan;

        float height = rows * stitchHeight;

        out << "M220 S100\n";

        out <<  QString("G90 G0 X%1 Y%2 F10000\n").arg(lbX,0,'f',4).arg(lbY,0,'f',4);

        out << "G0 F4000\nG1 F4000\n";

        for (int i=0; i<columns; i++)
        {
            for (int j = 0; j<rows; j++){
                    out << QString("G0 X%1 Y%2\n")
                           .arg(lbX + i*stitchWidth + 2,0,'f',4)
                           .arg(lbY + j*stitchHeight + 1,0,'f',4);

                    out << QString("G1 X%1\n")
                           .arg(lbX + i*stitchWidth + 11,0,'f',4);

                    for (int k = 1; k < strokeCount; k++){
                        if (k%2){
                            out << QString("G3 Y%2 J%4\n")
                                   .arg(lbY + j*stitchHeight + 1 + strokeSpan*k,0,'f',4)
                                   .arg(strokeSpan/2,0,'f',4);
                            out << QString("G1 X%1\n")
                                   .arg(lbX + i*stitchWidth + 2,0,'f',4);
                        } else {
                            out << QString("G2 Y%2 J%4\n")
                                   .arg(lbY + j*stitchHeight + 1 + strokeSpan*k,0,'f',4)
                                   .arg(strokeSpan/2,0,'f',4);
                            out << QString("G1 X%1\n")
                                   .arg(lbX + i*stitchWidth + 11,0,'f',4);
                        }
                    }
            }

            for (int j = 0; j<rows; j++){

                out << QString("G0 X%1 Y%2\n")
                       .arg(lbX + i*stitchWidth + 35,0,'f',4)
                       .arg(lbY + height - j*stitchHeight - 1,0,'f',4);

                out << QString("G1 X%1\n")
                       .arg(lbX + i*stitchWidth + 44,0,'f',4);

                for (int k = 1; k < strokeCount; k++){
                    if (k%2){
                        out << QString("G2 Y%2 J%4\n")
                               .arg(lbY + height - j*stitchHeight - 1 - strokeSpan*k,0,'f',4)
                               .arg(-strokeSpan/2,0,'f',4);
                        out << QString("G1 X%1\n")
                               .arg(lbX + i*stitchWidth + 35,0,'f',4);
                    } else {
                        out << QString("G3 Y%2 J%4\n")
                               .arg(lbY + height - j*stitchHeight - 1 - strokeSpan*k,0,'f',4)
                               .arg(-strokeSpan/2,0,'f',4);
                        out << QString("G1 X%1\n")
                               .arg(lbX + i*stitchWidth + 44,0,'f',4);
                    }
                }
            }
        }
    }

}

void GCodeGenerator::generateStandardStitches(float width, float height, bool small, bool randomCenter, float centerX, float centerY)
{
    float stitchWidth;
    float stitchHeight;
    if (!small){
        stitchWidth = BIG_STITCH_WIDTH;
        stitchHeight = BIG_STITCH_HEIGHT;
    } else {
        stitchWidth = SMALL_STITCH_WIDTH;
        stitchHeight = SMALL_STITCH_HEIGHT;
    }

    int columns = width/stitchWidth;
    int rows = height/stitchHeight;

    if (!small){
        centerX = columns*BIG_STITCH_WIDTH/2;
        centerY = rows*BIG_STITCH_HEIGHT/2;
    } else {
        centerX = columns*SMALL_STITCH_WIDTH/2;
        centerY = rows*SMALL_STITCH_HEIGHT/2;
    }

    if (randomCenter){
        generateStandardStitchesCut(columns,rows,stitchWidth,stitchHeight,centerX,centerY);
        generateStandardStitchesEngrave(columns,rows,stitchWidth,stitchHeight,centerX,centerY);
        return;
    }


    generateStandardStitchesCut(columns,rows,stitchWidth,stitchHeight,centerX,centerY);
    generateStandardStitchesEngrave(columns,rows,stitchWidth,stitchHeight,centerX,centerY);
}

void GCodeGenerator::clearFile()
{
    QFile stitchesGCode1("cutStitchesGCode.ngc");
    stitchesGCode1.open(QFile::WriteOnly | QFile::Truncate);
    QFile stitchesGCode2("engraveStitchesGCode.ngc");
    stitchesGCode2.open(QFile::WriteOnly | QFile::Truncate);
}
