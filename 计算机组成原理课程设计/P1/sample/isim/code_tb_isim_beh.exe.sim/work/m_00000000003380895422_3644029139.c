/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "counter = %d Output0 = %d Output1 = %d";
static const char *ng1 = "E:/Verliog/sample/code.v";
static int ng2[] = {0, 0, 0, 0};
static int ng3[] = {1, 0, 0, 0};
static int ng4[] = {4, 0, 0, 0};

void Monitor_36_1(char *);
void Monitor_36_1(char *);


static void Monitor_36_1_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 2248);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 1928);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 2088);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlogfile_write(1, 0, 3, ng0, 4, t0, (char)118, t3, 64, (char)118, t6, 64, (char)118, t9, 64);

LAB1:    return;
}

static void Initial_32_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(32, ng1);

LAB2:    xsi_set_current_line(33, ng1);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 64);
    xsi_set_current_line(34, ng1);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 2088);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 64);
    xsi_set_current_line(35, ng1);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 2248);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 64);
    xsi_set_current_line(36, ng1);
    Monitor_36_1(t0);

LAB1:    return;
}

static void Always_39_2(char *t0)
{
    char t13[8];
    char t28[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t29;

LAB0:    t1 = (t0 + 3416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng1);
    t2 = (t0 + 3984);
    *((int *)t2) = 1;
    t3 = (t0 + 3448);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng1);

LAB5:    xsi_set_current_line(40, ng1);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(45, ng1);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(40, ng1);

LAB9:    xsi_set_current_line(41, ng1);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 64);
    xsi_set_current_line(42, ng1);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(43, ng1);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    goto LAB8;

LAB10:    xsi_set_current_line(46, ng1);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    memset(t13, 0, 8);
    t4 = (t5 + 4);
    t14 = *((unsigned int *)t4);
    t15 = (~(t14));
    t16 = *((unsigned int *)t5);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB16;

LAB14:    if (*((unsigned int *)t4) == 0)
        goto LAB13;

LAB15:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;

LAB16:    t12 = (t13 + 4);
    t19 = *((unsigned int *)t12);
    t20 = (~(t19));
    t21 = *((unsigned int *)t13);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(48, ng1);

LAB20:    xsi_set_current_line(49, ng1);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    xsi_vlog_unsigned_add(t28, 64, t4, 64, t5, 32);
    t11 = (t0 + 2248);
    xsi_vlogvar_assign_value(t11, t28, 0, 0, 64);
    xsi_set_current_line(50, ng1);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    xsi_vlog_unsigned_divide(t28, 64, t4, 64, t5, 32);
    t11 = (t0 + 2088);
    xsi_vlogvar_assign_value(t11, t28, 0, 0, 64);

LAB19:    goto LAB12;

LAB13:    *((unsigned int *)t13) = 1;
    goto LAB16;

LAB17:    xsi_set_current_line(47, ng1);
    t24 = (t0 + 1928);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng3)));
    xsi_vlog_unsigned_add(t28, 64, t26, 64, t27, 32);
    t29 = (t0 + 1928);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 64);
    goto LAB19;

}

void Monitor_36_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 3472);
    t2 = (t0 + 4000);
    xsi_vlogfile_monitor((void *)Monitor_36_1_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000003380895422_3644029139_init()
{
	static char *pe[] = {(void *)Initial_32_0,(void *)Always_39_2,(void *)Monitor_36_1};
	xsi_register_didat("work_m_00000000003380895422_3644029139", "isim/code_tb_isim_beh.exe.sim/work/m_00000000003380895422_3644029139.didat");
	xsi_register_executes(pe);
}
