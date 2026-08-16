	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036944
sub_08036944: @ 0x08036944
	push {r4, lr}
	ldr r4, _0803698C @ =gUnknown_08090EE4
	ldr r1, [r4]
	movs r0, #1
	strh r0, [r1]
	bl sub_0803B3F8
	bl sub_0802FACC
	ldr r0, _08036990 @ =gProcTreeRootArray
	ldr r0, [r0]
	bl Proc_Run
	bl sub_08011B98
	bl sub_0801F0AC
	bl sub_0801F0C8
	ldr r1, _08036994 @ =gUnknown_03004094
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036998
	movs r0, #0
	strb r0, [r1]
	bl sub_0801F0E0
	bl sub_080128D0
	bl sub_08011FF0
	bl sub_08013B2C
	bl sub_08011AD8
	b _0803699A
	.align 2, 0
_0803698C: .4byte gUnknown_08090EE4
_08036990: .4byte gProcTreeRootArray
_08036994: .4byte gUnknown_03004094
_08036998:
	strb r0, [r1]
_0803699A:
	bl sub_0801F0FC
	ldr r1, _080369B8 @ =gUnknown_03004008
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bl sub_0803B408
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080369B8: .4byte gUnknown_03004008

