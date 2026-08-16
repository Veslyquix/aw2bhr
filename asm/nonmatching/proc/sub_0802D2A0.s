	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D2A0
sub_0802D2A0: @ 0x0802D2A0
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0802D2DA
	movs r0, #0xff
	bl sub_0801F838
	ldr r1, _0802D2E0 @ =gUnknown_03003100
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	ldr r2, _0802D2E4 @ =gUnknown_030040D8
	ldr r2, [r2]
	bl sub_08020D50
	ldr r0, _0802D2E8 @ =gUnknown_0849A9F8
	movs r1, #3
	bl Proc_Start
	bl sub_0801A168
	bl sub_08024500
	bl sub_08034F7C
_0802D2DA:
	pop {r0}
	bx r0
	.align 2, 0
_0802D2E0: .4byte gUnknown_03003100
_0802D2E4: .4byte gUnknown_030040D8
_0802D2E8: .4byte gUnknown_0849A9F8

