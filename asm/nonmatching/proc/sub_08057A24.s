	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057A24
sub_08057A24: @ 0x08057A24
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #1
	ands r3, r1
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08057A60 @ =gUnknown_08553A24
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r5, [r2]
	adds r1, r1, r5
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r0, r1, r0
	cmp r3, #0
	beq _08057A68
	lsls r0, r0, #1
	adds r0, r4, r0
	ldr r1, _08057A64 @ =gUnknown_0816D91C
	movs r2, #0x80
	lsls r2, r2, #8
	bl sub_080718F8
	b _08057A76
	.align 2, 0
_08057A60: .4byte gUnknown_08553A24
_08057A64: .4byte gUnknown_0816D91C
_08057A68:
	lsls r0, r0, #1
	adds r0, r4, r0
	ldr r1, _08057A7C @ =gUnknown_0816D900
	movs r2, #0xe0
	lsls r2, r2, #7
	bl sub_080718F8
_08057A76:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057A7C: .4byte gUnknown_0816D900

