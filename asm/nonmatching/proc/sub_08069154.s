	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069154
sub_08069154: @ 0x08069154
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r2, _080691AC @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	str r0, [r4, #0x2c]
	ldr r0, _080691B0 @ =gUnknown_08183A00
	ldr r1, _080691B4 @ =gUnknown_08499580
	ldr r1, [r1]
	bl sub_08011CAC
	bl sub_08013B0C
	bl sub_08013B1C
	movs r1, #1
	rsbs r1, r1, #0
	movs r2, #0xb8
	lsls r2, r2, #1
	ldr r0, _080691B8 @ =0xFFFFC800
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xc0
	str r0, [sp, #8]
	adds r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0xc
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #1
	movs r3, #0x88
	bl sub_080679D8
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080691AC: .4byte gUnknown_0202F204
_080691B0: .4byte gUnknown_08183A00
_080691B4: .4byte gUnknown_08499580
_080691B8: .4byte 0xFFFFC800

