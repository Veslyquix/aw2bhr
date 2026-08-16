	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AB3C
sub_0803AB3C: @ 0x0803AB3C
	push {r4, r5, r6, r7, lr}
	ldr r1, _0803AB6C @ =gUnknown_084997C8
	ldr r0, _0803AB70 @ =gUnknown_0849D89C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
	movs r4, #0
	movs r6, #0
	ldrb r0, [r7]
	cmp r0, #7
	beq _0803ABD0
_0803AB58:
	adds r1, r7, r4
	ldrb r0, [r1]
	cmp r0, #6
	bne _0803AB74
	movs r6, #4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _0803ABC8
	.align 2, 0
_0803AB6C: .4byte gUnknown_084997C8
_0803AB70: .4byte gUnknown_0849D89C
_0803AB74:
	ldrb r2, [r1]
	ldrb r5, [r1, #1]
	movs r3, #0
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0803AB92
	ldrb r0, [r1, #2]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	cmp r2, r0
	bne _0803ABAE
	movs r3, #0xd
	b _0803ABAE
_0803AB92:
	cmp r4, #1
	bls _0803ABAE
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #6
	beq _0803ABAE
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	subs r1, #2
	ldrb r1, [r1]
	cmp r0, r1
	bne _0803ABAE
	movs r3, #0xff
_0803ABAE:
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r0, r6, #0
	adds r1, r2, #0
	adds r2, r5, #0
	bl sub_0803AAC0
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803ABC8:
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #7
	bne _0803AB58
_0803ABD0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

