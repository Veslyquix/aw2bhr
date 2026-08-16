	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B8C4
sub_0802B8C4: @ 0x0802B8C4
	push {r4, lr}
	adds r4, r2, #0
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	orrs r1, r2
	ldr r2, _0802B90C @ =gUnknown_0849A22C
	ldr r2, [r2, #4]
	lsrs r4, r4, #0xe
	movs r3, #0xf0
	lsls r3, r3, #8
	orrs r3, r4
	bl sub_0801BD00
	ldr r0, _0802B910 @ =gUnknown_0810E9E0
	movs r1, #0xed
	lsls r1, r1, #1
	adds r4, r4, r1
	ldr r1, _0802B914 @ =0x000003FF
	ands r4, r1
	lsls r4, r4, #5
	ldr r1, _0802B918 @ =0x06010000
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #0x80
	bl sub_08011E54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B90C: .4byte gUnknown_0849A22C
_0802B910: .4byte gUnknown_0810E9E0
_0802B914: .4byte 0x000003FF
_0802B918: .4byte 0x06010000

