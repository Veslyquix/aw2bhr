	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806574C
sub_0806574C: @ 0x0806574C
	push {r4, r5, r6, lr}
	ldr r3, _08065784 @ =gUnknown_0816E108
	ldr r2, [r3]
	ldr r0, [r2]
	adds r0, #0x26
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	ldr r1, _08065788 @ =gUnknown_0202F200
	ldrb r1, [r1]
	adds r0, #0x2c
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _0806578C @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, #0x24
	strb r0, [r1]
	ldr r4, [r2]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r6, r3, #0
	cmp r0, #0
	beq _08065790
	bl sub_0802F4F4
	b _08065794
	.align 2, 0
_08065784: .4byte gUnknown_0816E108
_08065788: .4byte gUnknown_0202F200
_0806578C: .4byte gUnknown_03003FC0
_08065790:
	movs r0, #1
	rsbs r0, r0, #0
_08065794:
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r5, [r6]
	ldr r0, [r5]
	bl sub_0803BFBC
	bl sub_08065818
	movs r4, #0
	b _080657E8
_080657AC:
	ldr r3, [r5]
	adds r2, r3, #0
	adds r2, #0x20
	adds r2, r2, r4
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [r3, #0x18]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r5]
	adds r0, #9
	adds r0, r0, r4
	movs r1, #2
	cmp r4, #0
	bne _080657D2
	movs r1, #1
_080657D2:
	strb r1, [r0]
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	cmp r1, #1
	bne _080657E6
	subs r0, #0x1b
	adds r0, r0, r4
	strb r1, [r0]
_080657E6:
	adds r4, #1
_080657E8:
	ldr r0, [r5]
	ldrb r0, [r0, #8]
	cmp r4, r0
	blt _080657AC
	ldr r2, [r6]
	ldr r0, [r2]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x33
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x32
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2d
	strb r1, [r0]
	ldr r0, [r2]
	strh r1, [r0, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

