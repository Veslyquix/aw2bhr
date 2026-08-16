	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080451C8
sub_080451C8: @ 0x080451C8
	push {lr}
	bl sub_08012358
	ldr r2, _08045204 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _08045208 @ =gUnknown_03002020
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0804520C @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08045204: .4byte gUnknown_030030E0
_08045208: .4byte gUnknown_03002020
_0804520C: .4byte gUnknown_03002B28

