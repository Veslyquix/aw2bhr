	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063928
sub_08063928: @ 0x08063928
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08063958
	ldr r2, _08063950 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _08063954 @ =gUnknown_030020B4
	ldrb r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	adds r1, r3, #0
	bl sub_0801BB00
	b _0806396E
	.align 2, 0
_08063950: .4byte 0x04000200
_08063954: .4byte gUnknown_030020B4
_08063958:
	ldr r2, _08063974 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08063978 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0806397C @ =gUnknown_030020B4
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_0806396E:
	pop {r0}
	bx r0
	.align 2, 0
_08063974: .4byte 0x04000200
_08063978: .4byte 0x0000FFFD
_0806397C: .4byte gUnknown_030020B4

