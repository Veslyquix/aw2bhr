	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802ED00
sub_0802ED00: @ 0x0802ED00
	ldr r1, _0802ED2C @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0802ED30 @ =gUnknown_03000570
	ldr r0, [r0]
	cmp r0, #0
	bne _0802ED1A
	ldr r0, _0802ED34 @ =gUnknown_03000564
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #2
	bne _0802ED2A
_0802ED1A:
	ldr r2, _0802ED38 @ =0x04000128
	ldr r0, _0802ED3C @ =gUnknown_03000560
	ldr r0, [r0]
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0802ED2A:
	bx lr
	.align 2, 0
_0802ED2C: .4byte 0x0400010E
_0802ED30: .4byte gUnknown_03000570
_0802ED34: .4byte gUnknown_03000564
_0802ED38: .4byte 0x04000128
_0802ED3C: .4byte gUnknown_03000560

