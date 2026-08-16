	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080344F0
sub_080344F0: @ 0x080344F0
	push {r4, lr}
	ldr r3, _0803452C @ =gUnknown_08090D84
	ldr r2, [r3]
	movs r1, #0xd
	strb r1, [r2]
	strb r0, [r2, #6]
	ldr r1, _08034530 @ =gUnknown_03004490
	ldrb r0, [r1]
	strb r0, [r2, #7]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0xc]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r4, #0
	adds r1, #4
	adds r2, #0xe
_08034510:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	adds r4, #1
	cmp r4, #3
	ble _08034510
	ldr r0, [r3]
	bl sub_080308B4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803452C: .4byte gUnknown_08090D84
_08034530: .4byte gUnknown_03004490

