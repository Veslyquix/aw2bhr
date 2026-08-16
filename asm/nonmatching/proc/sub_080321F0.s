	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080321F0
sub_080321F0: @ 0x080321F0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0803222C @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #4
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r0, _08032230 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	beq _08032226
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_08032226:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803222C: .4byte gUnknown_0849B060
_08032230: .4byte gUnknown_0849B018

