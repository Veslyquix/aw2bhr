	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BB88
sub_0801BB88: @ 0x0801BB88
	push {r4, lr}
	ldr r2, _0801BBB8 @ =gUnknown_03000278
	ldr r3, _0801BBBC @ =gUnknown_03002520
	str r3, [r2]
	movs r4, #0xe0
	lsls r4, r4, #0x13
	str r4, [r2, #4]
	movs r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r2, _0801BBC0 @ =gUnknown_03000268
	lsls r1, r0, #3
	adds r3, r1, r3
	str r3, [r2]
	adds r4, r1, r4
	str r4, [r2, #4]
	strh r1, [r2, #8]
	movs r1, #0x80
	subs r1, r1, r0
	strh r1, [r2, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BBB8: .4byte gUnknown_03000278
_0801BBBC: .4byte gUnknown_03002520
_0801BBC0: .4byte gUnknown_03000268

