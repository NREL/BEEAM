#include <matrixop.h>
/* Declaration of C-structs */
/* Prototypes for functions used in model */
DYMOLA_STATIC IntegerArray    Modelica_Utilities_Streams_readMatrixSize_M(
  const char*  fileName0_0, const char*  matrixName0_0);
/* Codes used in model */

/* Flattened Modelica model:

function Modelica.Utilities.Streams.readMatrixSize
input String fileName "File where external data is stored" annotation (Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
input String matrixName "Name / identifier of the 2D Real array on the file";
output Integer dim[2] "Number of rows and columns of the 2D Real array";

external "C" ModelicaIO_readMatrixSizes(fileName, matrixName, dim);
annotation(Library={"ModelicaIO", "ModelicaMatIO", "zlib"}, LibraryDirectory="modelica://Modelica/Resources/Library");
end Modelica.Utilities.Streams.readMatrixSize;

  */
extern void (ModelicaIO_readMatrixSizes)(const char* , const char* , int  *);
DYMOLA_STATIC IntegerArray    Modelica_Utilities_Streams_readMatrixSize_M(
  const char*  fileName0_0, const char*  matrixName0_0) {
  PushContext("Modelica.Utilities.Streams.readMatrixSize")
  {
    /* Declare outputs and temporaries */
    IntegerArray    dim0_0;
    MarkObject retmark_ = PushMark();
    dim0_0=IntegerTemporary( 1, 2);
    RePushMark(&retmark_);
    IntegerFillAssign( dim0_0, 0);
    /* Start of real code */
    {
      (ModelicaIO_readMatrixSizes)(fileName0_0, matrixName0_0, dim0_0.data);
      }
    /* Output section */
    PopMark(retmark_);
    PopContext()
    return dim0_0;
  }}
/* DSblock C-code: */

#include <moutil.c>
#if !defined(DYM2CCUR)
 DYMOLA_STATIC const char*modelName="Modelica.Utilities.Streams.readMatrixSize";
#endif
DYMOLA_STATIC const char*usedLibraries[]={0};
DYMOLA_STATIC const char*dllLibraryPath[]={0};
DYMOLA_STATIC const char*default_dymosim_license_filename=0;
#define NX_    0
#define NX2_   0
#define NU_    0
#define NY_    0
#define NW_    0
#define NP_    0
#define NPS_   0
#define ND_   0
#define NXP_   0
#define NInitial_   0
#define MAXAuxStr_   0
#define MAXAuxStrLen_   500
#define NHash1_ 0
#define NHash2_ 0
#define NHash3_ 0
#define NI_    0
#define NRelF_ 0
#define NRel_  0
#define NTim_  0
#define NSamp_ 0
#define NCons_ 0
#define NA_    0
#define SizePre_ 0
#define SizeEq_ 0
#define SizeDelay_ 0
#define QNLmax_ 0
#define MAXAux 0
#define NrDymolaTimers_ 0
#define NWhen_ 0
#define NCheckIf_ 0
#define NGlobalHelp_ 0
#define NGlobalHelpI_ 0
#ifndef NExternalObject_
#define NExternalObject_ 0
#endif
#include <dsblock1.c>

const char*   fileName0_0;
const char*   matrixName0_0;
fileName0_0 = StringReadScalar ( "funcin.mat" , "fileName");
matrixName0_0 = StringReadScalar ( "funcin.mat" , "matrixName");

{
IntegerArray    dim0_0 = Modelica_Utilities_Streams_readMatrixSize_M(fileName0_0,
   matrixName0_0);
writeArrays("funcout.mat" , 1, "dim", integerMatrix , 1, dim0_0);

}
{ FILE*f=fopen("status.","w");if (f) fprintf(f,"Finished\n");fclose(f);}
{ FILE*f=fopen("success.","w");fclose(f);}
exit(0);

#include <dsblock6.c>

#include <dsblock5.c>

StartDataBlock
EndDataBlock
