	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C69C
sub_0801C69C: @ 0x0801C69C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	adds r2, r4, #0
	adds r2, #0x20
	movs r5, #0
	strb r5, [r2]
	cmp r3, #0
	beq _0801C6B6
	movs r0, #2
	strb r0, [r2]
_0801C6B6:
	adds r0, r4, #0
	bl sub_0801C640
	str r5, [r4, #0x24]
	movs r0, #0
	strh r5, [r4, #0x22]
	strh r5, [r4, #0x18]
	strh r6, [r4, #0x1e]
	str r5, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	strh r5, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	strh r5, [r4, #0x1c]
	strh r5, [r4, #0x28]
	adds r0, r4, #0
	bl sub_0801C2DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

