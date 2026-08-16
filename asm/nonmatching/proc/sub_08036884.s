	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036884
sub_08036884: @ 0x08036884
	push {lr}
	bl sub_0803B3F8
	bl sub_0802FACC
	ldr r0, _080368C4 @ =gProcTreeRootArray
	ldr r0, [r0]
	bl Proc_Run
	bl sub_08011B98
	bl sub_0801F0AC
	bl sub_0801F0C8
	ldr r1, _080368C8 @ =gUnknown_03004094
	ldrb r0, [r1]
	cmp r0, #0
	beq _080368CC
	movs r0, #0
	strb r0, [r1]
	bl sub_0801F0E0
	bl sub_080128D0
	bl sub_08011FF0
	bl sub_08013B2C
	bl sub_08011AD8
	b _080368CE
	.align 2, 0
_080368C4: .4byte gProcTreeRootArray
_080368C8: .4byte gUnknown_03004094
_080368CC:
	strb r0, [r1]
_080368CE:
	bl sub_0801F0FC
	ldr r1, _080368E4 @ =gUnknown_03004008
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bl sub_0803B408
	pop {r0}
	bx r0
	.align 2, 0
_080368E4: .4byte gUnknown_03004008

