	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053F0C
sub_08053F0C: @ 0x08053F0C
	push {lr}
	ldr r3, _08053F40 @ =gUnknown_08553734
	ldr r1, _08053F44 @ =gUnknown_030045A0
	ldr r0, _08053F48 @ =gUnknown_0300450C
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r2, [r0]
	ldr r0, _08053F4C @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08053F38
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08053F38
	ldr r2, [r3, #8]
_08053F38:
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08053F40: .4byte gUnknown_08553734
_08053F44: .4byte gUnknown_030045A0
_08053F48: .4byte gUnknown_0300450C
_08053F4C: .4byte gUnknown_03004504

