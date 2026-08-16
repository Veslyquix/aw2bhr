	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070544
sub_08070544: @ 0x08070544
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08070570 @ =gUnknown_08242308
	ldr r1, _08070574 @ =gUnknown_0824238C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _0807056A
	adds r0, r2, #0
	bl sub_08070C90
_0807056A:
	pop {r0}
	bx r0
	.align 2, 0
_08070570: .4byte gUnknown_08242308
_08070574: .4byte gUnknown_0824238C

