	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801FD30
sub_0801FD30: @ 0x0801FD30
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0
	ldr r0, _0801FD94 @ =gUnknown_08090938
	ldr r6, [r0]
	ldr r1, [r6]
	adds r7, r0, #0
	ldrh r1, [r1]
	cmp r3, r1
	bge _0801FD68
	ldr r1, _0801FD98 @ =gUnknown_03003340
	lsls r0, r5, #2
	adds r1, r0, r1
_0801FD54:
	cmp r3, r4
	beq _0801FD5E
	ldr r0, [r1]
	adds r0, r0, r3
	strb r2, [r0]
_0801FD5E:
	adds r3, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r3, r0
	blt _0801FD54
_0801FD68:
	movs r3, #0
	ldr r1, [r7]
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _0801FD8E
	adds r6, r1, #0
	ldr r1, _0801FD98 @ =gUnknown_03003340
_0801FD78:
	cmp r3, r5
	beq _0801FD82
	ldr r0, [r1]
	adds r0, r0, r4
	strb r2, [r0]
_0801FD82:
	adds r1, #4
	adds r3, #1
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r3, r0
	blt _0801FD78
_0801FD8E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD94: .4byte gUnknown_08090938
_0801FD98: .4byte gUnknown_03003340

