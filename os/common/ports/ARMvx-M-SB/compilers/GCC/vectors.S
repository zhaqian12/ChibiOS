/*
    ChibiOS - Copyright (C) 2006,2007,2008,2009,2010,2011,2012,2013,2014,
              2015,2016,2017,2018,2019,2020,2021,2022 Giovanni Di Sirio.

    This file is part of ChibiOS.

    ChibiOS is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation version 3 of the License.

    ChibiOS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/**
 * @file    ARMvx-M-SB/compilers/GCC/vectors.S
 * @brief   Sandbox VRQ vectors.
 *
 * @defgroup ARMVXM_SB_GCC_VECTORS Sandbox VRQ vectors
 * @{
 */

#if !defined(FALSE) || defined(__DOXYGEN__)
#define FALSE   0
#endif

#if !defined(TRUE) || defined(__DOXYGEN__)
#define TRUE    1
#endif

#if !defined(SB_VECTORS_NORTOS)
#define _FROM_ASM_
#include "chlicense.h"
#include "chconf.h"
#endif

/*===========================================================================*/
/* Module constants.                                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Module pre-compile time settings.                                         */
/*===========================================================================*/

/*===========================================================================*/
/* Code section.                                                             */
/*===========================================================================*/

#if !defined(__DOXYGEN__)

        .syntax unified
        .cpu    cortex-m3
        .thumb


        .bss

        .align      2
        .globl      __sb_vectors
__sb_in_vrq:
        .ds.l       1

        .text

        .align      2
        .globl      __crt0_vrq
__crt0_vrq:
        ldr.w       r1, =__sb_in_vrq
        mov.w       r2, #1
        str.w       r2, [r1]

        ldr.w       r2, =__sb_vectors
        ldr.w       r2, [r2, r0, lsl #2]
        blx         r2

        ldr.w       r1, =__sb_in_vrq
        mov.w       r2, #0
        str.w       r2, [r1]

#if !defined(SB_VECTORS_NORTOS)
#if CH_DBG_STATISTICS
        bl          __stats_start_measure_crit_thd
#endif
#if CH_DBG_SYSTEM_STATE_CHECK
        bl          __dbg_check_lock
#endif
        bl          chSchPreemption
#if CH_DBG_SYSTEM_STATE_CHECK
        bl          __dbg_check_unlock
#endif
#if CH_DBG_STATISTICS
        bl          __stats_stop_measure_crit_thd
#endif
#endif

        svc         #255

        .align      2
        .globl      __sb_vectors
__sb_vectors:
        .long       Vector00,   Vector04,   Vector08,   Vector0C
        .long       Vector10,   Vector14,   Vector18,   Vector1C
        .long       Vector20,   Vector24,   Vector28,   Vector2C
        .long       Vector30,   Vector34,   Vector38,   Vector3C
        .long       Vector40,   Vector44,   Vector48,   Vector4C
        .long       Vector50,   Vector54,   Vector58,   Vector5C
        .long       Vector60,   Vector64,   Vector68,   Vector6C
        .long       Vector70,   Vector74,   Vector78,   Vector7C

        .align      2
        .weak       Vector00,   Vector04,   Vector08,   Vector0C
        .weak       Vector10,   Vector14,   Vector18,   Vector1C
        .weak       Vector20,   Vector24,   Vector28,   Vector2C
        .weak       Vector30,   Vector34,   Vector38,   Vector3C
        .weak       Vector40,   Vector44,   Vector48,   Vector4C
        .weak       Vector50,   Vector54,   Vector58,   Vector5C
        .weak       Vector60,   Vector64,   Vector68,   Vector6C
        .weak       Vector70,   Vector74,   Vector78,   Vector7C

        .thumb_func
Vector00:
        .thumb_func
Vector04:
        .thumb_func
Vector08:
        .thumb_func
Vector0C:
        .thumb_func
Vector10:
        .thumb_func
Vector14:
        .thumb_func
Vector18:
        .thumb_func
Vector1C:
        .thumb_func
Vector20:
        .thumb_func
Vector24:
        .thumb_func
Vector28:
        .thumb_func
Vector2C:
        .thumb_func
Vector30:
        .thumb_func
Vector34:
        .thumb_func
Vector38:
        .thumb_func
Vector3C:
        .thumb_func
Vector40:
        .thumb_func
Vector44:
        .thumb_func
Vector48:
        .thumb_func
Vector4C:
        .thumb_func
Vector50:
        .thumb_func
Vector54:
        .thumb_func
Vector58:
        .thumb_func
Vector5C:
        .thumb_func
Vector60:
        .thumb_func
Vector64:
        .thumb_func
Vector68:
        .thumb_func
Vector6C:
        .thumb_func
Vector70:
        .thumb_func
Vector74:
        .thumb_func
Vector78:
        .thumb_func
Vector7C:
        bl          __unhandled_vrq

        .thumb_func
        .weak       __unhandled_vrq
__unhandled_vrq:
        svc         #255
.stay:  b           .stay

#endif /* !defined(__DOXYGEN__) */

/** @} */
