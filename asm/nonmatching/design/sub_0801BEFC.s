	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BEFC
sub_0801BEFC: @ 0x0801BEFC
	push {r4, r5, r6, r7, lr}
	ldr r7, [sp, #0x14]
	ldr r6, _0801BF24 @ =gUnknown_03002B24
	ldr r4, [r6]
	ldr r5, _0801BF28 @ =gUnknown_0200D510
	lsls r0, r0, #4
	adds r0, r0, r5
	ldr r5, [r0]
	str r5, [r4]
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	strh r7, [r4, #8]
	str r3, [r4, #0xc]
	str r4, [r0]
	adds r4, #0x10
	str r4, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BF24: .4byte gUnknown_03002B24
_0801BF28: .4byte gUnknown_0200D510

