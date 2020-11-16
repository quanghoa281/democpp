ident "@(#)Makefile    0.1 "
#/*--------------------------------------------------------------------*/
#/*                                                                    */
#/*     Makefile : ロードモジュール作成サンプル                        */
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
## 計算機モード取得
LDFLAGS         += ${LIBPATHS} ${LIBS}
###############################################################################
#
# ソース、c/fortranソース、オブジェクト、ライブラリ ディレクトリ
#
SOCDIR          = /export/export1/home/qden/sousei/my/home/udefsoc1/usrtmp/dc/kuan/tool
OBJDIR          = /export/export1/home/qden/sousei/my/home/udefsoc1/usrtmp/dc/kuan/tool
LMFDIR          = /export/export1/home/qden/sousei/my/home/udefsoc1/usrtmp/dc/kuan/tool
#POBJDIR                = $(DHOME)/DOBCL/proc
###############################################################################
#
# ロードモジュール名
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
# 暗黙のルール追加
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
# ガイド表示
#
guide:
                @echo "Usage: make <ﾀｰｹﾞｯﾄ>..."
                @echo "       <ﾀｰｹﾞｯﾄ> all          : 日付ﾁｪｯｸ後全exe生成"
                @echo "                clean        : *.exe *.o core 削除"
                @echo "                ﾌﾟﾛｸﾞﾗﾑ名    : ～.exe生成"
                @echo "                ﾌﾟﾛｸﾞﾗﾑ名.o  : ～.o生成"
###############################################################################
all:            $(PRGLMF) $(CMDLMF)
###############################################################################
#
#  ロードモジュールファイル生成（プロセス）
#
# DEL Rev.P64 S yos compile
#$(PRGNAM):     $(LMFDIR)/$$@.exe
#$(PRGLMF):     $(LMFDIR)/$$@
#$(PRGOBJ):     $(OBJDIR)/$$@
# DEL Rev.P64 E yos compile
###############################################################################
#
#  ロードモジュールファイル生成（コマンド）
#
# DEL Rev.P64 S yos compile
#$(CMDNAM):     $(LMFDIR)/$$@.exe
#$(CMDLMF):     $(LMFDIR)/$$@
#$(CMDOBJ):     $(OBJDIR)/$$@
# DEL Rev.P64 E yos compile
###############################################################################
#
# ファイル削除
#
clean:
        -@rm -f $(OBJDIR)/*.o
        -@rm -f $(LMFDIR)/*.exe core