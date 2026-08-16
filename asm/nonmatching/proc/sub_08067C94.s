	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067C94
sub_08067C94: @ 0x08067C94
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r3, [r4, #0x3c]
	cmp r2, r3
	ble _08067CEA
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _08067CC6
	str r2, [sp]
	movs r0, #4
	movs r1, #0xf0
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	str r1, [r4, #0x2c]
	subs r0, #0x80
	cmp r0, #0
	bge _08067CC0
	adds r0, #3
_08067CC0:
	asrs r0, r0, #2
	adds r0, #0x58
	b _08067CE2
_08067CC6:
	movs r1, #0x80
	rsbs r1, r1, #0
	str r2, [sp]
	movs r0, #4
	movs r2, #0x70
	bl Interpolate
	str r0, [r4, #0x2c]
	cmp r0, #0
	bge _08067CDC
	adds r0, #3
_08067CDC:
	asrs r1, r0, #2
	movs r0, #0x58
	subs r0, r0, r1
_08067CE2:
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
_08067CEA:
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, _08067D00 @ =gUnknown_085810A8
	movs r0, #0
	str r0, [sp]
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067D00: .4byte gUnknown_085810A8

