#include "gcodegenerator.h"

GCodeGenerator::GCodeGenerator(QObject *parent) : QObject(parent)
{

}

void GCodeGenerator::generateStitches(int rows, int columns,float stitchWidth, float stitchHeight)
{
    QFile stitchesGCode("stitchesGCode.ngc");
    if (stitchesGCode.open(QFile::WriteOnly | QFile::Truncate)) {
        QTextStream out(&stitchesGCode);

        out << "G90 G0 X0 Y0 F10000\n";

        out << "G0 F1500\nG1 F1500\n";

        for (int i=0; i<=rows; i++)
        {
            out << QString("G0 Y%1\n").arg(stitchHeight*i);

            for (int j=0; j<columns; j++)
                if (!(i%2))
                    out << QString("G1 X%1\nG0 X%2\nG1 X%3\n")
                           .arg(j*stitchWidth+stitchWidth/2,0,'f',2)
                           .arg(j*stitchWidth+stitchWidth/2+0.05,0,'f',2)
                           .arg(j*stitchWidth+stitchWidth,0,'f',2);
                else
                    out << QString("G1 X%1\nG0 X%2\nG1 X%3\n")
                           .arg(columns*stitchWidth-j*stitchWidth-stitchWidth/2,0,'f',2)
                           .arg(columns*stitchWidth-j*stitchWidth-stitchWidth/2-0.05,0,'f',2)
                           .arg(columns*stitchWidth-j*stitchWidth-stitchWidth,0,'f',2);
        }

        out << "G90 G0 X0 Y0 F10000\n";

        for (int i=0; i<=columns; i++)
        {
            out << QString("G0 X%1\n").arg(stitchWidth*i);

            for (int j=0; j<rows; j++)
                if (!(i%2))
                    out << QString("G1 Y%1\nG0 Y%2\nG1 Y%3\n")
                           .arg(j*stitchHeight+stitchHeight/2,0,'f',2)
                           .arg(j*stitchHeight+stitchHeight/2+0.05,0,'f',2)
                           .arg(j*stitchHeight+stitchHeight,0,'f',2);
                else
                    out << QString("G1 Y%1\nG0 Y%2\nG1 Y%3\n")
                           .arg(rows*stitchHeight-j*stitchHeight-stitchHeight/2,0,'f',2)
                           .arg(rows*stitchHeight-j*stitchHeight-stitchHeight/2-0.05,0,'f',2)
                           .arg(rows*stitchHeight-j*stitchHeight-stitchHeight,0,'f',2);
        }
        out << "G90 G0 X0 Y0 F10000\n";
    }
}

//Big - 46x20
