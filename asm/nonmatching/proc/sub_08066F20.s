	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066F20
sub_08066F20: @ 0x08066F20
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _08066F48 @ =gUnknown_0816E168
	ldr r0, [r1]
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	bne _08066F60
	adds r3, r2, #0
	adds r3, #0x33
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #6
	beq _08066F50
	ldr r1, _08066F4C @ =gUnknown_08580D6C
	b _08066F7A
	.align 2, 0
_08066F48: .4byte gUnknown_0816E168
_08066F4C: .4byte gUnknown_08580D6C
_08066F50:
	ldr r0, [r2, #0x6c]
	ldr r1, _08066F5C @ =gUnknown_08580D88
	adds r0, #0x48
	ldrb r0, [r0]
	b _08066F7A
	.align 2, 0
_08066F5C: .4byte gUnknown_08580D88
_08066F60:
	adds r0, r2, #0
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08066F88
	ldr r1, _08066F84 @ =gUnknown_08580D78
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08066F7A:
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	b _08066F8A
	.align 2, 0
_08066F84: .4byte gUnknown_08580D78
_08066F88:
	ldr r5, _08066FD8 @ =0x000009DB
_08066F8A:
	ldr r6, [r4]
	ldr r0, [r6]
	ldrh r0, [r0, #0x2e]
	cmp r5, r0
	beq _08066FD0
	bl sub_08014878
	ldr r4, _08066FDC @ =gUnknown_08499578
	ldr r0, [r4]
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #3
	movs r2, #0x11
	movs r3, #0x1a
	bl sub_08012BC8
	ldr r2, [r4]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #0x11
	adds r3, r5, #0
	bl sub_08014740
	adds r0, #0x3a
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r6]
	strh r5, [r0, #0x2e]
_08066FD0:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066FD8: .4byte 0x000009DB
_08066FDC: .4byte gUnknown_08499578

