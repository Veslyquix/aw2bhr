	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072E70
sub_08072E70: @ 0x08072E70
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r5, #0
	b _08072EC0
_08072E7A:
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x2a
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	adds r0, #0x46
	adds r0, r0, r5
	ldrb r2, [r0]
	ldr r3, [r4, #0x64]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r2, [r0]
	adds r0, #8
	lsls r3, r5, #3
	ldrh r0, [r0]
	adds r3, r3, r0
	adds r0, r4, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r3, r3, r0
	str r3, [sp]
	movs r0, #1
	ldr r3, _08072F00 @ =gUnknown_081CC01C
	bl PutSprite
	adds r5, #1
_08072EC0:
	ldr r0, [r4, #0x58]
	cmp r5, r0
	blt _08072E7A
	ldr r0, [r4, #0x64]
	adds r0, #1
	str r0, [r4, #0x64]
	cmp r0, #8
	ble _08072EF6
	movs r5, #0
	ldr r0, [r4, #0x58]
	cmp r5, r0
	bge _08072EF0
	adds r2, r4, #0
	adds r2, #0x46
	adds r1, r4, #0
	adds r1, #0x2a
_08072EE0:
	adds r0, r2, r5
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r5, #1
	ldr r0, [r4, #0x58]
	cmp r5, r0
	blt _08072EE0
_08072EF0:
	adds r0, r4, #0
	bl Proc_Break
_08072EF6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072F00: .4byte gUnknown_081CC01C

