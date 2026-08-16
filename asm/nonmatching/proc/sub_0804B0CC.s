	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B0CC
sub_0804B0CC: @ 0x0804B0CC
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0804B104 @ =gUnknown_084C3D9C
	movs r1, #0
	bl sub_080152EC
	ldr r2, _0804B108 @ =gUnknown_030044E0
	ldr r0, [r2]
	adds r0, #0x5c
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x5e
	strb r4, [r0]
	ldr r0, [r2]
	lsls r1, r4, #1
	adds r0, #0x5f
	strb r1, [r0]
	ldr r0, [r2]
	str r5, [r0, #0x58]
	lsls r4, r4, #3
	adds r0, #0x60
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B104: .4byte gUnknown_084C3D9C
_0804B108: .4byte gUnknown_030044E0

