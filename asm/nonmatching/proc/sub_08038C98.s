	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038C98
sub_08038C98: @ 0x08038C98
	push {r4, r5, r6, r7, lr}
	ldr r0, _08038CF4 @ =gUnknown_0809165C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08038CF8 @ =gUnknown_080A1C24
	ldr r1, _08038CFC @ =0x06013940
	movs r2, #0xa0
	lsls r2, r2, #4
	bl sub_08011E54
	ldr r5, _08038D00 @ =gUnknown_08090F14
	ldr r6, [r5]
	ldr r2, [r6]
	ldrb r4, [r2, #6]
	lsls r4, r4, #0x19
	lsrs r4, r4, #0x19
	ldr r7, _08038D04 @ =gUnknown_08499594
	ldr r1, [r7]
	subs r1, r2, r1
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
	ldrb r1, [r2]
	bl sub_08042D1C
	cmp r4, r0
	bge _08038D0C
	ldr r2, _08038D08 @ =gUnknown_08090F18
	ldr r0, [r2]
	ldr r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	b _08038D34
	.align 2, 0
_08038CF4: .4byte gUnknown_0809165C
_08038CF8: .4byte gUnknown_080A1C24
_08038CFC: .4byte 0x06013940
_08038D00: .4byte gUnknown_08090F14
_08038D04: .4byte gUnknown_08499594
_08038D08: .4byte gUnknown_08090F18
_08038D0C:
	ldr r2, [r6]
	ldr r1, [r7]
	subs r1, r2, r1
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
	ldrb r1, [r2]
	bl sub_08042D1C
	ldr r2, _08038D74 @ =gUnknown_08090F18
	ldr r1, [r2]
	ldr r1, [r1]
_08038D34:
	adds r1, #0x44
	strb r0, [r1]
	adds r4, r2, #0
	movs r0, #0
	bl sub_080386EC
	ldr r0, [r5]
	ldr r1, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08038848
	ldr r0, [r4]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	ldrb r1, [r1]
	adds r0, #0x38
	strb r1, [r0]
	ldr r1, _08038D78 @ =0x0000FFFF
	adds r0, r1, #0
	bl sub_080386DC
	bl sub_08038D7C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038D74: .4byte gUnknown_08090F18
_08038D78: .4byte 0x0000FFFF

