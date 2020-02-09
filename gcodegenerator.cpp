#include "gcodegenerator.h"

GCodeGenerator::GCodeGenerator(QObject *parent) : QObject(parent)
{

}

void GCodeGenerator::generateStitches(float rows, float columns,float stitchWidth, float stitchHeight, float centerX, float centerY)
{
    QFile stitchesGCode("stitchesGCode.ngc");
    if (stitchesGCode.open(QFile::WriteOnly | QFile::Append)) {
        QTextStream out(&stitchesGCode);

        float lbX = centerX - columns*stitchWidth/2;
        float lbY = centerY - rows*stitchHeight/2;

        out <<  QString("G90 G0 X%1 Y%2 F10000\n").arg(lbX,0,'f',4).arg(lbY,0,'f',4);

        out << "G0 F1500\nG1 F1500\n";

        for (int i=0; i<=rows; i++)
        {
            out << QString("G0 Y%1\n").arg(lbY+stitchHeight*i,0,'f',4);

            for (int j=0; j<columns; j++)
                if (!(i%2))
                    out << QString("G1 X%1\nG0 X%2\nG1 X%3\n")
                           .arg(lbX+j*stitchWidth+stitchWidth/2,0,'f',4)
                           .arg(lbX+j*stitchWidth+stitchWidth/2+0.05,0,'f',4)
                           .arg(lbX+j*stitchWidth+stitchWidth,0,'f',4);
                else
                    out << QString("G1 X%1\nG0 X%2\nG1 X%3\n")
                           .arg(lbX+columns*stitchWidth-j*stitchWidth-stitchWidth/2,0,'f',4)
                           .arg(lbX+columns*stitchWidth-j*stitchWidth-stitchWidth/2-0.05,0,'f',4)
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
                           .arg(lbY+j*stitchHeight+stitchHeight/2+0.05,0,'f',4)
                           .arg(lbY+j*stitchHeight+stitchHeight,0,'f',4);
                else
                    out << QString("G1 Y%1\nG0 Y%2\nG1 Y%3\n")
                           .arg(lbY+rows*stitchHeight-j*stitchHeight-stitchHeight/2,0,'f',4)
                           .arg(lbY+rows*stitchHeight-j*stitchHeight-stitchHeight/2-0.05,0,'f',4)
                           .arg(lbY+rows*stitchHeight-j*stitchHeight-stitchHeight,0,'f',4);
        }
    }
}

void GCodeGenerator::clearFile()
{
    QFile stitchesGCode("stitchesGCode.ngc");
    stitchesGCode.open(QFile::WriteOnly | QFile::Truncate);
}

//Big - 46x20
//Small - 46x12.85
