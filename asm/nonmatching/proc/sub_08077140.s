	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077140
sub_08077140: @ 0x08077140
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r1, #0
	lsls r6, r2, #0xc
_0807714C:
	movs r3, #0
	lsls r0, r1, #1
	adds r5, r1, #1
	adds r0, r0, r1
	lsls r4, r0, #1
	lsls r2, r1, #5
_08077158:
	adds r0, r7, r3
	adds r0, r0, r4
	adds r0, r0, r6
	adds r1, r2, r3
	lsls r1, r1, #1
	add r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08077158
	lsls r0, r5, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #5
	bls _0807714C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

