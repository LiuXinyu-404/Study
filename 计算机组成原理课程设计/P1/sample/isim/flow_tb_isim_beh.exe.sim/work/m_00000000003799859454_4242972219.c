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
static const char *ng0 = "E:/Verliog/sample/flow.v";



static void Always_32_0(char *t0)
{
    char t7[8];
    char t10[8];
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 3488);
    *((int *)t2) = 1;
    t3 = (t0 + 3200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(32, ng0);

LAB5:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t6 = *((char **)t4);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_multiply(t7, 32, t5, 32, t6, 32);
    t4 = (t0 + 1368U);
    t8 = *((char **)t4);
    t4 = (t0 + 1528U);
    t9 = *((char **)t4);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_multiply(t10, 32, t8, 32, t9, 32);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t7, 32, t10, 32);
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2088);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    goto LAB2;

}


extern void work_m_00000000003799859454_4242972219_init()
{
	static char *pe[] = {(void *)Always_32_0};
	xsi_register_didat("work_m_00000000003799859454_4242972219", "isim/flow_tb_isim_beh.exe.sim/work/m_00000000003799859454_4242972219.didat");
	xsi_register_executes(pe);
}
