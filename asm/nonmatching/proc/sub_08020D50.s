	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020D50
sub_08020D50: @ 0x08020D50
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	ldr r0, _08020DB4 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	ldrb r1, [r4]
	bl sub_08042D50
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_08020B88
	ldr r2, _08020DB8 @ =gUnknown_085D5ABC
	ldrb r1, [r4]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r1, r0, r2
	ldrb r0, [r1, #0xf]
	cmp r0, #1
	beq _08020DAE
	ldrb r2, [r1, #0xe]
	subs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08020B88
_08020DAE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020DB4: .4byte gUnknown_08499594
_08020DB8: .4byte gUnknown_085D5ABC

