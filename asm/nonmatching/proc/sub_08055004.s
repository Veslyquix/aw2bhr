	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055004
sub_08055004: @ 0x08055004
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #3
	beq _08055040
	lsls r1, r4, #0xd
	movs r2, #0xa0
	lsls r2, r2, #5
	adds r0, r2, #0
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r4, #8
	adds r0, #0xa0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08055038 @ =gUnknown_0855089C
	ldr r2, _0805503C @ =0x06010000
	adds r1, r1, r2
	movs r2, #0xb2
	lsls r2, r2, #2
	bl CpuFastSet
	b _08055042
	.align 2, 0
_08055038: .4byte gUnknown_0855089C
_0805503C: .4byte 0x06010000
_08055040:
	movs r5, #0x80
_08055042:
	ldr r1, _08055054 @ =gUnknown_020296B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055054: .4byte gUnknown_020296B0

