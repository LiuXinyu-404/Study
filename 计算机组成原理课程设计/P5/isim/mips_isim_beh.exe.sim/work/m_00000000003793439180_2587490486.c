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
static const char *ng0 = "C:/Computer/P5/alu.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {33U, 0U};
static unsigned int ng4[] = {35U, 0U};
static unsigned int ng5[] = {13U, 0U};
static unsigned int ng6[] = {15U, 0U};
static int ng7[] = {31, 0};
static int ng8[] = {16, 0};
static int ng9[] = {15, 0};
static unsigned int ng10[] = {43U, 0U};



static void Initial_29_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(29, ng0);

LAB2:    xsi_set_current_line(30, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB1:    return;
}

static void Always_33_1(char *t0)
{
    char t6[8];
    char t30[8];
    char t55[8];
    char t61[8];
    char t62[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    char *t54;
    int t56;
    int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    int t63;
    char *t64;
    int t65;
    int t66;
    int t67;
    int t68;
    int t69;

LAB0:    t1 = (t0 + 3096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3416);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB5:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB33;

LAB30:    if (t18 != 0)
        goto LAB32;

LAB31:    *((unsigned int *)t6) = 1;

LAB33:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB44;

LAB41:    if (t18 != 0)
        goto LAB43;

LAB42:    *((unsigned int *)t6) = 1;

LAB44:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB56;

LAB53:    if (t18 != 0)
        goto LAB55;

LAB54:    *((unsigned int *)t6) = 1;

LAB56:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB57;

LAB58:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng10)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB64;

LAB61:    if (t18 != 0)
        goto LAB63;

LAB62:    *((unsigned int *)t6) = 1;

LAB64:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB65;

LAB66:
LAB67:
LAB59:
LAB47:
LAB36:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(34, ng0);

LAB13:    xsi_set_current_line(35, ng0);
    t28 = (t0 + 1208U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng3)));
    memset(t30, 0, 8);
    t31 = (t29 + 4);
    t32 = (t28 + 4);
    t33 = *((unsigned int *)t29);
    t34 = *((unsigned int *)t28);
    t35 = (t33 ^ t34);
    t36 = *((unsigned int *)t31);
    t37 = *((unsigned int *)t32);
    t38 = (t36 ^ t37);
    t39 = (t35 | t38);
    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t32);
    t42 = (t40 | t41);
    t43 = (~(t42));
    t44 = (t39 & t43);
    if (t44 != 0)
        goto LAB17;

LAB14:    if (t42 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t30) = 1;

LAB17:    t46 = (t30 + 4);
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t49 = *((unsigned int *)t30);
    t50 = (t49 & t48);
    t51 = (t50 != 0);
    if (t51 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB25;

LAB22:    if (t18 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t6) = 1;

LAB25:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB26;

LAB27:
LAB28:
LAB20:    goto LAB12;

LAB16:    t45 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(35, ng0);

LAB21:    xsi_set_current_line(36, ng0);
    t52 = (t0 + 1368U);
    t53 = *((char **)t52);
    t52 = (t0 + 1528U);
    t54 = *((char **)t52);
    memset(t55, 0, 8);
    xsi_vlog_unsigned_add(t55, 32, t53, 32, t54, 32);
    t52 = (t0 + 1928);
    xsi_vlogvar_assign_value(t52, t55, 0, 0, 32);
    goto LAB20;

LAB24:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB25;

LAB26:    xsi_set_current_line(38, ng0);

LAB29:    xsi_set_current_line(39, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    t21 = (t0 + 1528U);
    t28 = *((char **)t21);
    memset(t30, 0, 8);
    xsi_vlog_unsigned_minus(t30, 32, t22, 32, t28, 32);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t30, 0, 0, 32);
    goto LAB28;

LAB32:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB33;

LAB34:    xsi_set_current_line(42, ng0);

LAB37:    xsi_set_current_line(43, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    t21 = (t0 + 1528U);
    t28 = *((char **)t21);
    t33 = *((unsigned int *)t22);
    t34 = *((unsigned int *)t28);
    t35 = (t33 | t34);
    *((unsigned int *)t30) = t35;
    t21 = (t22 + 4);
    t29 = (t28 + 4);
    t31 = (t30 + 4);
    t36 = *((unsigned int *)t21);
    t37 = *((unsigned int *)t29);
    t38 = (t36 | t37);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t31);
    t40 = (t39 != 0);
    if (t40 == 1)
        goto LAB38;

LAB39:
LAB40:    t46 = (t0 + 1928);
    xsi_vlogvar_assign_value(t46, t30, 0, 0, 32);
    goto LAB36;

LAB38:    t41 = *((unsigned int *)t30);
    t42 = *((unsigned int *)t31);
    *((unsigned int *)t30) = (t41 | t42);
    t32 = (t22 + 4);
    t45 = (t28 + 4);
    t43 = *((unsigned int *)t32);
    t44 = (~(t43));
    t47 = *((unsigned int *)t22);
    t56 = (t47 & t44);
    t48 = *((unsigned int *)t45);
    t49 = (~(t48));
    t50 = *((unsigned int *)t28);
    t57 = (t50 & t49);
    t51 = (~(t56));
    t58 = (~(t57));
    t59 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t59 & t51);
    t60 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t60 & t58);
    goto LAB40;

LAB43:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB44;

LAB45:    xsi_set_current_line(45, ng0);

LAB48:    xsi_set_current_line(46, ng0);
    t21 = (t0 + 1528U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 0);
    *((unsigned int *)t30) = t34;
    t35 = *((unsigned int *)t28);
    t36 = (t35 >> 0);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t37 & 65535U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 65535U);
    t29 = (t0 + 1928);
    t31 = (t0 + 1928);
    t32 = (t31 + 72U);
    t45 = *((char **)t32);
    t46 = ((char*)((ng7)));
    t52 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t55, t61, t62, ((int*)(t45)), 2, t46, 32, 1, t52, 32, 1);
    t53 = (t55 + 4);
    t39 = *((unsigned int *)t53);
    t56 = (!(t39));
    t54 = (t61 + 4);
    t40 = *((unsigned int *)t54);
    t57 = (!(t40));
    t63 = (t56 && t57);
    t64 = (t62 + 4);
    t41 = *((unsigned int *)t64);
    t65 = (!(t41));
    t66 = (t63 && t65);
    if (t66 == 1)
        goto LAB49;

LAB50:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    t4 = (t0 + 1928);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng9)));
    t21 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t6, t30, t55, ((int*)(t7)), 2, t8, 32, 1, t21, 32, 1);
    t22 = (t6 + 4);
    t9 = *((unsigned int *)t22);
    t56 = (!(t9));
    t28 = (t30 + 4);
    t10 = *((unsigned int *)t28);
    t57 = (!(t10));
    t63 = (t56 && t57);
    t29 = (t55 + 4);
    t11 = *((unsigned int *)t29);
    t65 = (!(t11));
    t66 = (t63 && t65);
    if (t66 == 1)
        goto LAB51;

LAB52:    goto LAB47;

LAB49:    t42 = *((unsigned int *)t62);
    t67 = (t42 + 0);
    t43 = *((unsigned int *)t55);
    t44 = *((unsigned int *)t61);
    t68 = (t43 - t44);
    t69 = (t68 + 1);
    xsi_vlogvar_assign_value(t29, t30, t67, *((unsigned int *)t61), t69);
    goto LAB50;

LAB51:    t12 = *((unsigned int *)t55);
    t67 = (t12 + 0);
    t13 = *((unsigned int *)t6);
    t14 = *((unsigned int *)t30);
    t68 = (t13 - t14);
    t69 = (t68 + 1);
    xsi_vlogvar_assign_value(t3, t2, t67, *((unsigned int *)t30), t69);
    goto LAB52;

LAB55:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB56;

LAB57:    xsi_set_current_line(49, ng0);

LAB60:    xsi_set_current_line(50, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    t21 = (t0 + 1528U);
    t28 = *((char **)t21);
    memset(t30, 0, 8);
    xsi_vlog_unsigned_add(t30, 32, t22, 32, t28, 32);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t30, 0, 0, 32);
    goto LAB59;

LAB63:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB64;

LAB65:    xsi_set_current_line(52, ng0);

LAB68:    xsi_set_current_line(53, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    t21 = (t0 + 1528U);
    t28 = *((char **)t21);
    memset(t30, 0, 8);
    xsi_vlog_unsigned_add(t30, 32, t22, 32, t28, 32);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t30, 0, 0, 32);
    goto LAB67;

}


extern void work_m_00000000003793439180_2587490486_init()
{
	static char *pe[] = {(void *)Initial_29_0,(void *)Always_33_1};
	xsi_register_didat("work_m_00000000003793439180_2587490486", "isim/mips_isim_beh.exe.sim/work/m_00000000003793439180_2587490486.didat");
	xsi_register_executes(pe);
}
