	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064410
sub_08064410: @ 0x08064410
	push {r4, r5, lr}
	ldr r3, _0806446C @ =gUnknown_03002EE0
	ldr r2, [r3]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08064430
	ldr r1, _08064470 @ =gUnknown_03002040
	adds r1, #0x14
	adds r0, r2, #0
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r2, r4}
	stm r1!, {r2, r4}
_08064430:
	ldr r2, [r3]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806444C
	ldr r1, _08064470 @ =gUnknown_03002040
	adds r1, #0x28
	adds r0, r2, #0
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
_0806444C:
	ldr r2, [r3]
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08064466
	ldr r1, _08064470 @ =gUnknown_03002040
	adds r0, r2, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
_08064466:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806446C: .4byte gUnknown_03002EE0
_08064470: .4byte gUnknown_03002040

