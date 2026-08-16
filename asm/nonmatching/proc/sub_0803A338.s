	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A338
sub_0803A338: @ 0x0803A338
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803A414 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r4, _0803A418 @ =gUnknown_0849D89C
	ldr r1, [r4]
	ldrb r1, [r1]
	lsrs r1, r1, #3
	ldr r3, _0803A41C @ =gUnknown_080D4228
	ldr r2, _0803A420 @ =0x00008360
	str r2, [sp]
	movs r2, #0
	bl sub_08071948
	bl sub_0801F114
	ldr r5, _0803A424 @ =0x06010000
	ldr r2, _0803A428 @ =0x00000296
	movs r0, #0
	adds r1, r5, #0
	movs r3, #0x15
	bl sub_0801F150
	movs r0, #6
	bl sub_0801F234
	movs r0, #0x23
	bl sub_0801F234
	movs r0, #0x24
	bl sub_0801F234
	movs r0, #0x25
	bl sub_0801F234
	movs r0, #0x26
	bl sub_0801F234
	movs r0, #0x27
	bl sub_0801F234
	movs r0, #0x28
	bl sub_0801F234
	movs r0, #0x29
	bl sub_0801F234
	movs r0, #0x2a
	bl sub_0801F234
	movs r0, #0x3b
	bl sub_0801F234
	movs r2, #0xe5
	lsls r2, r2, #1
	movs r0, #3
	adds r1, r5, #0
	movs r3, #0x16
	bl sub_0801F150
	movs r0, #0xac
	bl sub_0801F234
	movs r0, #0xad
	bl sub_0801F234
	movs r0, #0xae
	bl sub_0801F234
	movs r0, #0xaf
	bl sub_0801F234
	movs r0, #0xb0
	bl sub_0801F234
	movs r0, #0xb1
	bl sub_0801F234
	movs r0, #0xb2
	bl sub_0801F234
	movs r0, #0xb3
	bl sub_0801F234
	movs r0, #0xb4
	bl sub_0801F234
	movs r0, #0xb5
	bl sub_0801F234
	movs r0, #0xb6
	bl sub_0801F234
	movs r0, #0xb7
	bl sub_0801F234
	ldr r1, [r4]
	ldrb r0, [r1]
	ldr r1, [r1, #4]
	bl sub_0803A190
	ldr r1, [r4]
	ldrb r0, [r1]
	ldr r1, [r1, #4]
	bl sub_0803A2BC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A414: .4byte gUnknown_08499580
_0803A418: .4byte gUnknown_0849D89C
_0803A41C: .4byte gUnknown_080D4228
_0803A420: .4byte 0x00008360
_0803A424: .4byte 0x06010000
_0803A428: .4byte 0x00000296

