	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073930
sub_08073930: @ 0x08073930
	ldr r0, _08073964 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _08073968 @ =gUnknown_081CC02C
	cmp r1, #0xa0
	bls _0807394A
	ldr r0, [r2]
	ldr r1, _0807396C @ =gUnknown_0202FDDC
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
_0807394A:
	ldr r3, _08073970 @ =0x04000014
	ldr r0, [r2]
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r3]
	bx lr
	.align 2, 0
_08073964: .4byte 0x04000006
_08073968: .4byte gUnknown_081CC02C
_0807396C: .4byte gUnknown_0202FDDC
_08073970: .4byte 0x04000014

