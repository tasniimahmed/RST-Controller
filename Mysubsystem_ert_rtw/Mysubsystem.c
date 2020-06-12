/*
 * File: Mysubsystem.c
 *
 * Code generated for Simulink model 'Mysubsystem'.
 *
 * Model version                  : 1.0
 * Simulink Coder version         : 8.14 (R2018a) 06-Feb-2018
 * C/C++ source code generated on : Thu Jun 11 03:44:47 2020
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: NXP->Cortex-M4
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#include "Mysubsystem.h"

/* Block signals and states (default storage) */
DW rtDW;

/* External inputs (root inport signals with default storage) */
ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
ExtY rtY;

/* Real-time model */
RT_MODEL rtM_;
RT_MODEL *const rtM = &rtM_;

/* Model step function */
void Mysubsystem_step(void)
{
  real_T rtb_Rz;

  /* DiscreteFilter: '<S1>/1//S(z)' incorporates:
   *  DiscreteFilter: '<S1>/R(z)'
   *  DiscreteFilter: '<S1>/T(z)'
   *  Inport: '<Root>/In1'
   *  Inport: '<Root>/In2'
   *  Sum: '<S1>/Sum1'
   */
  rtb_Rz = ((((2.5 * rtU.In1 + -4.4285 * rtDW.Tz_states[0]) + 2.3078 *
              rtDW.Tz_states[1]) - ((1.0387 * rtU.In2 + -1.3332 *
    rtDW.Rz_states[0]) + 0.67381 * rtDW.Rz_states[1])) - -0.67914 *
            rtDW.uSz_states[0]) - -0.32086 * rtDW.uSz_states[1];

  /* Outport: '<Root>/Out1' incorporates:
   *  DiscreteFilter: '<S1>/1//S(z)'
   */
  rtY.Out1 = rtb_Rz;

  /* Update for DiscreteFilter: '<S1>/T(z)' incorporates:
   *  Inport: '<Root>/In1'
   */
  rtDW.Tz_states[1] = rtDW.Tz_states[0];
  rtDW.Tz_states[0] = rtU.In1;

  /* Update for DiscreteFilter: '<S1>/R(z)' incorporates:
   *  Inport: '<Root>/In2'
   */
  rtDW.Rz_states[1] = rtDW.Rz_states[0];
  rtDW.Rz_states[0] = rtU.In2;

  /* Update for DiscreteFilter: '<S1>/1//S(z)' */
  rtDW.uSz_states[1] = rtDW.uSz_states[0];
  rtDW.uSz_states[0] = rtb_Rz;
}

/* Model initialize function */
void Mysubsystem_initialize(void)
{
  /* (no initialization code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
