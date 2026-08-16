	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031440
sub_08031440: @ 0x08031440
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08031498 @ =gUnknown_0849B048
	adds r0, r5, #0
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08031460
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08031460:
	ldr r0, _0803149C @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08031480
	movs r0, #0x66
	bl sub_0803B4DC
	adds r0, r5, #0
	bl sub_0801537C
	adds r0, r4, #0
	bl Proc_Break
_08031480:
	ldr r4, _080314A0 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031498: .4byte gUnknown_0849B048
_0803149C: .4byte gUnknown_03002EE0
_080314A0: .4byte gUnknown_0849B060

