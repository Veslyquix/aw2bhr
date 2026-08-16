	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805521C
sub_0805521C: @ 0x0805521C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	ldr r4, _08055268 @ =gUnknown_020296B0
	lsls r3, r0, #2
	adds r3, r3, r0
	lsls r3, r3, #3
	adds r7, r3, r4
	strh r6, [r7]
	lsls r0, r6, #0x15
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r4, _0805526C @ =gUnknown_085D70A8
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrh r5, [r1]
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r5, #0
	beq _08055274
	ldr r1, _08055270 @ =0x06010000
	add r1, ip
	lsrs r2, r5, #2
	bl CpuFastSet
	b _08055276
	.align 2, 0
_08055268: .4byte gUnknown_020296B0
_0805526C: .4byte gUnknown_085D70A8
_08055270: .4byte 0x06010000
_08055274:
	strh r5, [r7]
_08055276:
	lsrs r0, r5, #5
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

