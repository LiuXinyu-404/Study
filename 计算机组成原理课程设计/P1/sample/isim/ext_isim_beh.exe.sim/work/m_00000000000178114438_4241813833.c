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
static const char *ng0 = "C:/Computer/Verliog/sample/ext.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static int ng4[] = {0, 0};
static unsigned int ng5[] = {3U, 0U};
static int ng6[] = {2, 0};



static void Always_26_0(char *t0)
{
    char t7[8];
    char t10[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(26, ng0);

LAB5:    xsi_set_current_line(27, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(28, ng0);
    t8 = (t0 + 1048U);
    t9 = *((char **)t8);
    xsi_vlogtype_sign_extend(t7, 32, t9, 16);
    t8 = (t0 + 1608);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 32);
    goto LAB15;

LAB9:    xsi_set_current_line(29, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memcpy(t7, t4, 8);
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 32);
    goto LAB15;

LAB11:    xsi_set_current_line(30, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    xsi_vlogtype_concat(t10, 48, 48, 2U, t8, 16, t3, 32);
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t10, 0, 0, 32);
    goto LAB15;

LAB13:    xsi_set_current_line(31, ng0);

LAB16:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    xsi_vlogtype_sign_extend(t7, 32, t4, 16);
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 32);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t8 = ((char*)((ng6)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_lshift(t7, 32, t4, 32, t8, 32);
    t9 = (t0 + 1608);
    xsi_vlogvar_assign_value(t9, t7, 0, 0, 32);
    goto LAB15;

}


extern void work_m_00000000000178114438_4241813833_init()
{
	static char *pe[] = {(void *)Always_26_0};
	xsi_register_didat("work_m_00000000000178114438_4241813833", "isim/ext_isim_beh.exe.sim/work/m_00000000000178114438_4241813833.didat");
	xsi_register_executes(pe);
}
