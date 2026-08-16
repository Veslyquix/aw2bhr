	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080853B0
sub_080853B0: @ 0x080853B0
	push {r4, r5, lr}
	sub sp, #4
	movs r4, #0
	ldr r5, _080853BC @ =gUnknown_081D93F8
	b _080853E8
	.align 2, 0
_080853BC: .4byte gUnknown_081D93F8
_080853C0:
	ldr r0, _080853F8 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, #0x3d
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #3
	adds r1, #0x10
	movs r2, #1
	str r2, [sp]
	movs r2, #8
	movs r3, #0
	bl sub_0801F34C
	adds r4, #1
_080853E8:
	ldr r1, [r5]
	ldrb r0, [r1, #1]
	cmp r0, #2
	bne _080853FC
	ldrb r0, [r1, #2]
	bl sub_0802490C
	b _08085400
	.align 2, 0
_080853F8: .4byte gUnknown_08499598
_080853FC:
	bl sub_080248F8
_08085400:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _080853C0
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

