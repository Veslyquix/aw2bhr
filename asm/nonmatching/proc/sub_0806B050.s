	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B050
sub_0806B050: @ 0x0806B050
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0806B08C @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0806B090 @ =gUnknown_03002020
	movs r3, #0
	strh r3, [r0]
	ldr r1, _0806B094 @ =gUnknown_03002B28
	ldr r2, [r4, #0x58]
	movs r0, #0xe
	subs r0, r0, r2
	strh r0, [r1]
	ldr r0, _0806B098 @ =gUnknown_03001FFC
	strh r3, [r0]
	cmp r2, #0
	bne _0806B080
	adds r0, r4, #0
	bl Proc_Break
_0806B080:
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B08C: .4byte gUnknown_030030E0
_0806B090: .4byte gUnknown_03002020
_0806B094: .4byte gUnknown_03002B28
_0806B098: .4byte gUnknown_03001FFC

