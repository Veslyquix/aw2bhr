	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A4A8
sub_0803A4A8: @ 0x0803A4A8
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _0803A520 @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r4, _0803A524 @ =gUnknown_0849D89C
	ldr r1, [r4]
	ldrb r1, [r1]
	lsrs r1, r1, #3
	ldr r3, _0803A528 @ =gUnknown_080D4228
	ldr r2, _0803A52C @ =0x00008360
	str r2, [sp]
	movs r2, #0
	bl sub_08071948
	movs r0, #2
	bl sub_08013AD4
	ldr r1, [r4]
	ldrb r0, [r1]
	ldr r1, [r1, #4]
	bl sub_0803A190
	movs r0, #0
	bl sub_08013AD4
	bl sub_0802465C
	ldr r4, [r4]
	ldrb r0, [r4]
	lsrs r0, r0, #3
	adds r0, #1
	ldr r1, _0803A530 @ =gUnknown_08499578
	ldr r2, [r1]
	ldr r5, _0803A534 @ =gUnknown_0849E398
	ldr r3, _0803A538 @ =gUnknown_081BA068
	ldr r1, [r4, #4]
	ldrb r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r1, #1
	lsls r1, r1, #5
	adds r1, r1, r5
	ldrh r3, [r1]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	movs r1, #0xf8
	str r1, [sp, #4]
	movs r1, #0xa
	bl sub_08014740
	adds r0, #0x3a
	movs r1, #1
	strb r1, [r0]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A520: .4byte gUnknown_08499580
_0803A524: .4byte gUnknown_0849D89C
_0803A528: .4byte gUnknown_080D4228
_0803A52C: .4byte 0x00008360
_0803A530: .4byte gUnknown_08499578
_0803A534: .4byte gUnknown_0849E398
_0803A538: .4byte gUnknown_081BA068

