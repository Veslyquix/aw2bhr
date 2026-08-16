	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080381C0
sub_080381C0: @ 0x080381C0
	push {r4, r5, lr}
	sub sp, #8
	ldr r1, _08038224 @ =gUnknown_03003FC0
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08038236
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _0803822C
	movs r2, #0
	movs r1, #1
	ldr r4, _08038228 @ =gUnknown_08090EFC
	ldr r0, [r4]
	ldr r3, [r0]
_080381E0:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080381FA
	mov r5, sp
	adds r0, r5, r2
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080381FA:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _080381E0
	cmp r2, #1
	bne _08038236
	mov r0, sp
	ldrb r1, [r0]
	ldr r0, [r4]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #1
	bne _08038236
_08038220:
	movs r0, #0
	b _08038238
	.align 2, 0
_08038224: .4byte gUnknown_03003FC0
_08038228: .4byte gUnknown_08090EFC
_0803822C:
	bl sub_0803861C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038220
_08038236:
	movs r0, #1
_08038238:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

