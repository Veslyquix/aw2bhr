	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072F04
sub_08072F04: @ 0x08072F04
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x68
	ldrb r0, [r0]
	cmp r0, #0
	beq _08072F1C
	movs r0, #0
	str r0, [r4, #0x64]
	adds r0, r4, #0
	bl Proc_Break
_08072F1C:
	movs r5, #0
	ldr r0, [r4, #0x58]
	cmp r5, r0
	bge _08072F64
	movs r6, #0x10
	rsbs r6, r6, #0
_08072F28:
	lsls r0, r5, #1
	adds r1, r4, #0
	adds r1, #0x2a
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r6
	ble _08072F5C
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
	ldr r3, _08072F6C @ =gUnknown_081CC01C
	bl sub_0801BEBC
_08072F5C:
	adds r5, #1
	ldr r0, [r4, #0x58]
	cmp r5, r0
	blt _08072F28
_08072F64:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072F6C: .4byte gUnknown_081CC01C

