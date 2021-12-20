//GCCGEN   JOB CLASS=C,REGION=0K,TIME=1440
//*
//ST3CMP   PROC GCCPREF='GCC',MEMBER='',
// PDPPREF='PDPCLIB',
// COS1='-Os -S -ansi -pedantic-errors -remap -DHAVE_CONFIG_H',
// COS2='-DIN_GCC -DPUREISO -o dd:out -'
//*
//COMP     EXEC PGM=STAGE2,
// PARM='&COS1 &COS2'
//STEPLIB  DD DSN=&GCCPREF..TMPLOAD,DISP=SHR
//SYSIN    DD DSN=&GCCPREF..SOURCE(&MEMBER),DISP=SHR
//INCLUDE  DD DSN=&GCCPREF..INCLUDE,DISP=SHR,DCB=BLKSIZE=32720
//         DD DSN=&PDPPREF..INCLUDE,DISP=SHR
//SYSINCL  DD DSN=&GCCPREF..INCLUDE,DISP=SHR,DCB=BLKSIZE=32720
//         DD DSN=&PDPPREF..INCLUDE,DISP=SHR
//OUT      DD DSN=&GCCPREF..S3(&MEMBER),DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSTERM  DD SYSOUT=*
//*
//ASM      EXEC PGM=ASMA90,
//            PARM='DECK,NOLIST',
//            COND=(4,LT,COMP)
//SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR,DCB=BLKSIZE=32720
//         DD DSN=&PDPPREF..MACLIB,DISP=SHR
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(20,10))
//SYSUT2   DD UNIT=SYSALLDA,SPACE=(CYL,(10,10))
//SYSUT3   DD UNIT=SYSALLDA,SPACE=(CYL,(10,10))
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DUMMY
//SYSGO    DD DUMMY
//SYSPUNCH DD DSN=&GCCPREF..OBJ,DISP=MOD
//SYSIN    DD DSN=&GCCPREF..S3(&MEMBER),DISP=SHR
//*
//         PEND
//*
//ST3PDP   PROC GCCPREF='GCC',PDPPREF='PDPCLIB',MEMBER='',
// COS1='-Os -S -ansi -pedantic-errors',
// COS2='-DXXX_MEMMGR -o dd:out -'
//*
//COMP     EXEC PGM=STAGE2,
// PARM='&COS1 &COS2'
//STEPLIB  DD DSN=&GCCPREF..TMPLOAD,DISP=SHR
//SYSIN    DD DSN=&PDPPREF..SOURCE(&MEMBER),DISP=SHR
//INCLUDE  DD DSN=&PDPPREF..INCLUDE,DISP=SHR
//SYSINCL  DD DSN=&PDPPREF..INCLUDE,DISP=SHR
//OUT      DD DSN=&GCCPREF..S3(&MEMBER),DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSTERM  DD SYSOUT=*
//*
//ASM      EXEC PGM=ASMA90,
//            PARM='DECK,NOLIST',
//            COND=(4,LT,COMP)
//SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR,DCB=BLKSIZE=32720
//         DD DSN=&PDPPREF..MACLIB,DISP=SHR
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(20,10))
//SYSUT2   DD UNIT=SYSALLDA,SPACE=(CYL,(10,10))
//SYSUT3   DD UNIT=SYSALLDA,SPACE=(CYL,(10,10))
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DUMMY
//SYSGO    DD DUMMY
//SYSPUNCH DD DSN=&GCCPREF..OBJ,DISP=MOD
//SYSIN    DD DSN=&GCCPREF..S3(&MEMBER),DISP=SHR
//*
//         PEND
//*
//PDPASM   PROC GCCPREF='GCC',PDPPREF='PDPCLIB',MEMBER=''
//*
//ASM      EXEC PGM=ASMA90,
//            PARM='DECK,NOLIST'
//SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR,DCB=BLKSIZE=32720
//         DD DSN=SYS1.MODGEN,DISP=SHR
//         DD DSN=&PDPPREF..MACLIB,DISP=SHR
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(20,10))
//SYSUT2   DD UNIT=SYSALLDA,SPACE=(CYL,(10,10))
//SYSUT3   DD UNIT=SYSALLDA,SPACE=(CYL,(10,10))
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DUMMY
//SYSGO    DD DUMMY
//SYSPUNCH DD DSN=&GCCPREF..OBJ,DISP=MOD
//SYSIN    DD DSN=&PDPPREF..SOURCE(&MEMBER),DISP=SHR
//*
//         PEND
//*
//LINK     PROC GCCPREF='GCC',MODULE=''
//LKED     EXEC PGM=IEWL,
// PARM='MAP,LIST,SIZE=(999424,65536),AMODE=31,RMODE=ANY'
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(30,10))
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DSN=&GCCPREF..OBJ,DISP=(OLD,DELETE)
//*SYSLIB not needed
//SYSLMOD  DD DSN=&GCCPREF..LINKLIB(&MODULE),DISP=SHR
//         PEND
//*
//COMPARE  PROC GCCPREF='GCC',ONE='',TWO=''
//COMPR    EXEC PGM=IEBCOMPR
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=&GCCPREF..&ONE,DISP=SHR
//SYSUT2   DD DSN=&GCCPREF..&TWO,DISP=SHR
//SYSIN    DD DUMMY
//         PEND
//*
//INSN@ATT EXEC ST3CMP,MEMBER=INSN@ATT
//INSN@EMI EXEC ST3CMP,MEMBER=INSN@EMI
//INSN@EXT EXEC ST3CMP,MEMBER=INSN@EXT
//INSN@OPI EXEC ST3CMP,MEMBER=INSN@OPI
//INSN@OUT EXEC ST3CMP,MEMBER=INSN@OUT
//INSN@REC EXEC ST3CMP,MEMBER=INSN@REC
//INTEGRAT EXEC ST3CMP,MEMBER=INTEGRAT
//JUMP     EXEC ST3CMP,MEMBER=JUMP
//LANGHOOK EXEC ST3CMP,MEMBER=LANGHOOK
//LBASENAM EXEC ST3CMP,MEMBER=LBASENAM
//LCM      EXEC ST3CMP,MEMBER=LCM
//LINE@MAP EXEC ST3CMP,MEMBER=LINE@MAP
//LISTS    EXEC ST3CMP,MEMBER=LISTS
//LOCAL@AL EXEC ST3CMP,MEMBER=LOCAL@AL
//LOOP     EXEC ST3CMP,MEMBER=LOOP
//MKDEPS   EXEC ST3CMP,MEMBER=MKDEPS
//OBSTACK  EXEC ST3CMP,MEMBER=OBSTACK
//OPTABS   EXEC ST3CMP,MEMBER=OPTABS
//PARAMS   EXEC ST3CMP,MEMBER=PARAMS
//PARTITIO EXEC ST3CMP,MEMBER=PARTITIO
//PREDICT  EXEC ST3CMP,MEMBER=PREDICT
//PREFIX   EXEC ST3CMP,MEMBER=PREFIX
//PRINT@RT EXEC ST3CMP,MEMBER=PRINT@RT
//PRINT@TR EXEC ST3CMP,MEMBER=PRINT@TR
//PROFILE  EXEC ST3CMP,MEMBER=PROFILE
//REAL     EXEC ST3CMP,MEMBER=REAL
//RECOG    EXEC ST3CMP,MEMBER=RECOG
//REGCLASS EXEC ST3CMP,MEMBER=REGCLASS
//REGMOVE  EXEC ST3CMP,MEMBER=REGMOVE
//REGRENAM EXEC ST3CMP,MEMBER=REGRENAM
//RELOAD   EXEC ST3CMP,MEMBER=RELOAD
//RELOAD1  EXEC ST3CMP,MEMBER=RELOAD1
//RESOURCE EXEC ST3CMP,MEMBER=RESOURCE
//RTL@ERRO EXEC ST3CMP,MEMBER=RTL@ERRO
//RTL      EXEC ST3CMP,MEMBER=RTL
//RTLANAL  EXEC ST3CMP,MEMBER=RTLANAL
//SAFE@CTY EXEC ST3CMP,MEMBER=SAFE@CTY
//SBITMAP  EXEC ST3CMP,MEMBER=SBITMAP
//SIBCALL  EXEC ST3CMP,MEMBER=SIBCALL
//SIMPLIFY EXEC ST3CMP,MEMBER=SIMPLIFY
//SPLAY@TR EXEC ST3CMP,MEMBER=SPLAY@TR
//SSA@CCP  EXEC ST3CMP,MEMBER=SSA@CCP
//SSA@DCE  EXEC ST3CMP,MEMBER=SSA@DCE
//SSA      EXEC ST3CMP,MEMBER=SSA
//STMT     EXEC ST3CMP,MEMBER=STMT
//STOR@LAY EXEC ST3CMP,MEMBER=STOR@LAY
//STRINGPO EXEC ST3CMP,MEMBER=STRINGPO
//STRSIGNA EXEC ST3CMP,MEMBER=STRSIGNA
//TIMEVAR  EXEC ST3CMP,MEMBER=TIMEVAR
//TOPLEV   EXEC ST3CMP,MEMBER=TOPLEV
//TREE@DUM EXEC ST3CMP,MEMBER=TREE@DUM
//TREE@INL EXEC ST3CMP,MEMBER=TREE@INL
//TREE     EXEC ST3CMP,MEMBER=TREE
//UNIXIO   EXEC ST3CMP,MEMBER=UNIXIO
//UNROLL   EXEC ST3CMP,MEMBER=UNROLL
//VARASM   EXEC ST3CMP,MEMBER=VARASM
//VARRAY   EXEC ST3CMP,MEMBER=VARRAY
//VASPRINT EXEC ST3CMP,MEMBER=VASPRINT
//VERSION  EXEC ST3CMP,MEMBER=VERSION
//XMALLOC  EXEC ST3CMP,MEMBER=XMALLOC
//XSTRERRO EXEC ST3CMP,MEMBER=XSTRERRO
//XSTRDUP  EXEC ST3CMP,MEMBER=XSTRDUP
//XEXIT    EXEC ST3CMP,MEMBER=XEXIT
//CONCAT   EXEC ST3CMP,MEMBER=CONCAT
//*
//MVSSTART EXEC PDPASM,MEMBER=MVSSTART
//MVSSUPA  EXEC PDPASM,MEMBER=MVSSUPA
//*
//START    EXEC ST3PDP,MEMBER=START
//STDIO    EXEC ST3PDP,MEMBER=STDIO
//STDLIB   EXEC ST3PDP,MEMBER=STDLIB
//CTYPE    EXEC ST3PDP,MEMBER=CTYPE
//STRING   EXEC ST3PDP,MEMBER=STRING
//TIME     EXEC ST3PDP,MEMBER=TIME
//ERRNO    EXEC ST3PDP,MEMBER=ERRNO
//ASSERT   EXEC ST3PDP,MEMBER=ASSERT
//LOCALE   EXEC ST3PDP,MEMBER=LOCALE
//MATH     EXEC ST3PDP,MEMBER=MATH
//SETJMP   EXEC ST3PDP,MEMBER=SETJMP
//SIGNAL   EXEC ST3PDP,MEMBER=SIGNAL
//@@MEMMGR EXEC ST3PDP,MEMBER=@@MEMMGR
//*
//CMP      EXEC COMPARE,ONE='S2',TWO='S3'
//SYSIN    DD *
 COMPARE TYPORG=PO
/*
//*
//* If the STAGE3 assembler files don't match the STAGE2
//* assembler files, then failsafe by not producing a GCC
//* module, as there is a compiler bug somewhere.
//*
//DOLINK   EXEC LINK,COND=(4,LT),MODULE='GCC'
//
