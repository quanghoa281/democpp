ident "@(#)Makefile    0.1 "
#/*--------------------------------------------------------------------*/
#/*                                                                    */
#/*     Makefile : ���[�h���W���[���쐬�T���v��                        */
#/*                                                                    */
#/*              Designed by TDST Y.uemura  2003-09-20   Ver. 0.00     */
#/*              Coded    by TDST Y.uemura  2003-09-20   Ver. 0.00     */
#/*              Revised  by                                           */
#/*                                                                    */
#/*     power Dispatch and Transmission Computer Control Designing     */
#/*     Group TOSHIBA FUCHU WORKS.                                     */
#/*                                                                    */
#/*     (C)COPYRIGHT 2003 BY TOSHIBA CORPORATION ALL RIGHTS RESERVED   */
#/*                                                                    */
#/*--------------------------------------------------------------------*/
CCC             =  /usr/bin/gcc
INCLUDE         = -I${DHOME} -I${PACEHOME}/include
INCLUDE        += -I${DHOME}/DICEQU
CCFLAGS        += -g ${INCLUDE} -D_POSIX_C_SOURCE=199506L -D_XOPEN_SOURCE=500 -DDBG_L1
LIBPATHS        = -L${DHOME}/DSUBK
LIBS           += -lafGiproma -laaCommon -ladCDSNE -la0Gui -lagGremcastCmmu
LIBS           += -lMW2date -lMW2bit -lMW2etc -lMW2msg -lMW2mutex
LIBS           += -ljbEquipment -ljbEtc -ljbSub -ljbCpp
LIBS           += -lsubda -lcppda -ladCpp -lsubdz -lsubzsta -lscl -ldms
LIBS           += -ladEtc
## �v�Z�@���[�h�擾
LDFLAGS         += ${LIBPATHS} ${LIBS}
###############################################################################
#
# �\�[�X�Ac/fortran�\�[�X�A�I�u�W�F�N�g�A���C�u���� �f�B���N�g��
#
SOCDIR          = /export/export1/home/qden/sousei/my/home/udefsoc1/usrtmp/dc/kuan/tool
OBJDIR          = /export/export1/home/qden/sousei/my/home/udefsoc1/usrtmp/dc/kuan/tool
LMFDIR          = /export/export1/home/qden/sousei/my/home/udefsoc1/usrtmp/dc/kuan/tool
#POBJDIR                = $(DHOME)/DOBCL/proc
###############################################################################
#
# ���[�h���W���[����
#
#PRGSOC         = recno_mng.c
#PRGSOC        += size.c
#PRGSOC        += rtof.c
PRGSOC         += gtordb.c
#PRGSOC        += gtof_cn.c
#PRGSOC        += recno_que.c
#PRGSOC        += link.c
#PRGSOC        += link_wd.c
PRGSOC         += link_no.c
CMDSOC          =
#
PRGOBJ          = $(PRGSOC:.c=.o)
PRGLMF          = $(PRGSOC:.c=.exe)
PRGNAM          = $(PRGSOC:.c=)
CMDOBJ          = $(CMDSOC:.c=.o)
CMDLMF          = $(CMDSOC:.c=.exe)
CMDNAM          = $(CMDSOC:.c=)
###############################################################################
#
# �Öق̃��[���ǉ�
#
#.SUFFIXES:      .c .c~ .c .c~ $(SUFFIXES)
.SUFFIXES:
# MOD Rev.P64 S yos compile
#$(OBJDIR)%.o:$(SOCDIR)%.c
%.o:%.c
# MOD Rev.P64 E yos compile
                @echo make object: $(*F).o
#               @$(CCC) -c -g -D_DBG_L1 -g -D_DBG_L2 $(SOCDIR)/$(*F).c $(CCFLAGS) -o $(OBJDIR)/$(*F).o
#               @$(CCC) -c -g $(SOCDIR)/$(*F).c $(CCFLAGS) $(LDFLAGS) -o $(OBJDIR)/$(*F).o
                @$(CCC) -c -g $(SOCDIR)/$(*F).c $(CCFLAGS)  -o $(OBJDIR)/$(*F).o
# MOD Rev.P64 S yos compile
#$(LMFDIR)%.exe:$(OBJDIR)%.o
%.exe:%.o
# MOD Rev.P64 E yos compile
                @echo make object: $(*F).exe
                @rm -f $(LMFDIR)/$(*F).exe
#               @$(CCC) $(OBJDIR)/$(*F).o $(POBJDIR)/$(*F)/*.o -o $(LMFDIR)/$(*F).exe $(CCFLAGS) $(LDFLAGS)
                @$(CCC) $(OBJDIR)/$(*F).o -o $(LMFDIR)/$(*F).exe $(CCFLAGS) $(LDFLAGS)
###############################################################################
#
# �K�C�h�\��
#
guide:
                @echo "Usage: make <���ޯ�>..."
                @echo "       <���ޯ�> all          : ���t������Sexe����"
                @echo "                clean        : *.exe *.o core �폜"
                @echo "                ��۸��і�    : �`.exe����"
                @echo "                ��۸��і�.o  : �`.o����"
###############################################################################
all:            $(PRGLMF) $(CMDLMF)
###############################################################################
#
#  ���[�h���W���[���t�@�C�������i�v���Z�X�j
#
# DEL Rev.P64 S yos compile
#$(PRGNAM):     $(LMFDIR)/$$@.exe
#$(PRGLMF):     $(LMFDIR)/$$@
#$(PRGOBJ):     $(OBJDIR)/$$@
# DEL Rev.P64 E yos compile
###############################################################################
#
#  ���[�h���W���[���t�@�C�������i�R�}���h�j
#
# DEL Rev.P64 S yos compile
#$(CMDNAM):     $(LMFDIR)/$$@.exe
#$(CMDLMF):     $(LMFDIR)/$$@
#$(CMDOBJ):     $(OBJDIR)/$$@
# DEL Rev.P64 E yos compile
###############################################################################
#
# �t�@�C���폜
#
clean:
        -@rm -f $(OBJDIR)/*.o
        -@rm -f $(LMFDIR)/*.exe core