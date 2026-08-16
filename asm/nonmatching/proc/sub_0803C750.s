	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C750
sub_0803C750: @ 0x0803C750
	movs r3, #0
	ldr r2, _0803C760 @ =gUnknown_02027FB0
_0803C754:
	ldr r1, [r2]
	cmp r1, #0
	bne _0803C764
	str r0, [r2]
	ldrb r0, [r2, #4]
	b _0803C76E
	.align 2, 0
_0803C760: .4byte gUnknown_02027FB0
_0803C764:
	cmp r1, r0
	bne _0803C776
	ldrb r0, [r2, #4]
	cmp r0, #1
	bhi _0803C77E
_0803C76E:
	adds r0, #1
	strb r0, [r2, #4]
	movs r0, #1
	b _0803C780
_0803C776:
	adds r2, #8
	adds r3, #1
	cmp r3, #0xf
	ble _0803C754
_0803C77E:
	movs r0, #0
_0803C780:
	bx lr
	.align 2, 0

