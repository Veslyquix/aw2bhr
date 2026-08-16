	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045700
sub_08045700: @ 0x08045700
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r6, _08045738 @ =gUnknown_020288B4
	movs r4, #0
	movs r5, #0
	ldr r0, _0804573C @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	muls r0, r1, r0
	cmp r4, r0
	bge _0804575C
_08045718:
	adds r1, r6, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08045740
	cmp r4, #0
	beq _0804572A
	strb r4, [r2]
	adds r2, #1
	movs r4, #0
_0804572A:
	ldrb r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	b _08045750
	.align 2, 0
_08045738: .4byte gUnknown_020288B4
_0804573C: .4byte gUnknown_08499590
_08045740:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x7f
	bne _08045750
	strb r4, [r2]
	adds r2, #1
	movs r4, #0
_08045750:
	adds r5, #1
	ldrh r0, [r3]
	ldrh r1, [r3, #2]
	muls r0, r1, r0
	cmp r5, r0
	blt _08045718
_0804575C:
	cmp r4, #0
	beq _08045764
	strb r4, [r2]
	adds r2, #1
_08045764:
	movs r0, #0xff
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

