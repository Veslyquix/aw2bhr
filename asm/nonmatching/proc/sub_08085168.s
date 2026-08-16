	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085168
sub_08085168: @ 0x08085168
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_080853B0
	ldr r2, _080851C4 @ =0x000082AC
	movs r0, #0x20
	movs r1, #0x28
	movs r3, #3
	bl sub_08043B60
	adds r4, #0x66
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, _080851C8 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	adds r0, #0x3d
	movs r1, #1
	str r1, [sp]
	movs r1, #8
	movs r2, #0x28
	movs r3, #0
	bl sub_0801F34C
	ldrb r0, [r4]
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080851BA
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #0x98
	movs r1, #0x70
	bl sub_080436DC
_080851BA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080851C4: .4byte 0x000082AC
_080851C8: .4byte gUnknown_08499598

