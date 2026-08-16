	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806362C
sub_0806362C: @ 0x0806362C
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _08063660 @ =0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08063650
	ldr r5, _08063664 @ =0x0000795C
	movs r4, #0x80
_08063640:
	adds r2, #1
	cmp r2, r5
	bgt _08063650
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08063640
_08063650:
	movs r0, #0x96
	lsls r0, r0, #2
	bl sub_08063614
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063660: .4byte 0x04000128
_08063664: .4byte 0x0000795C

