	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012F6C
sub_08012F6C: @ 0x08012F6C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _08012F8A
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuSet
	b _08012F9C
_08012F8A:
	adds r2, r3, #0
	cmp r2, #0
	bge _08012F92
	adds r2, #3
_08012F92:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
_08012F9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

