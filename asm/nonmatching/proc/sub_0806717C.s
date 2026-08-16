	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806717C
sub_0806717C: @ 0x0806717C
	push {r4, lr}
	ldr r3, _080671B8 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _080671BC @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _080671C0 @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r1, _080671C4 @ =gUnknown_03001FFC
	movs r4, #0x1f
	strh r4, [r1]
	ldrh r2, [r3]
	ldr r1, _080671C8 @ =0x0000FFE0
	ands r1, r2
	orrs r1, r4
	strh r1, [r3]
	ldrb r1, [r3]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r3]
	movs r1, #0x1f
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080671B8: .4byte gUnknown_030030E0
_080671BC: .4byte gUnknown_03002020
_080671C0: .4byte gUnknown_03002B28
_080671C4: .4byte gUnknown_03001FFC
_080671C8: .4byte 0x0000FFE0

