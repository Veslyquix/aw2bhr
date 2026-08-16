	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08082C0C
sub_08082C0C: @ 0x08082C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	mov sb, r1
	cmp r1, #3
	bgt _08082C9C
	movs r5, #0x80
	lsls r5, r5, #1
	movs r0, #4
	str r0, [sp]
	adds r1, r5, #0
	movs r2, #8
	mov r3, sb
	bl Interpolate
	str r0, [r7, #0x38]
	ldr r4, _08082C98 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #4
	adds r0, r6, #0
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _08082C5E
	movs r1, #2
_08082C5E:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #4
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _08082C7C
	movs r1, #2
_08082C7C:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, r8
	adds r3, r4, #0
	bl SetObjAffine
	b _08082D18
	.align 2, 0
_08082C98: .4byte gSinLut
_08082C9C:
	mov r3, sb
	cmp r3, #6
	bgt _08082D18
	movs r5, #0x80
	lsls r5, r5, #1
	subs r3, #4
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	adds r2, r5, #0
	bl Interpolate
	str r0, [r7, #0x38]
	ldr r4, _08082DCC @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #4
	adds r0, r6, #0
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _08082CE2
	movs r1, #2
_08082CE2:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #4
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r7, #0x38]
	cmp r1, #0
	bne _08082D00
	movs r1, #2
_08082D00:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, r8
	adds r3, r4, #0
	bl SetObjAffine
_08082D18:
	adds r1, r7, #0
	adds r1, #0x4e
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r2, r1, #0
	cmp r0, #0
	blt _08082D28
	b _08082EAC
_08082D28:
	movs r6, #1
	rsbs r6, r6, #0
	adds r0, r7, #0
	adds r0, #0x52
	str r0, [sp, #0xc]
	str r2, [sp, #4]
	mov r8, r0
_08082D36:
	ldr r2, _08082DD0 @ =gUnknown_08616972
	ldr r1, [sp, #4]
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, #1
	subs r0, r6, r0
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r5, r6, #1
	lsls r4, r5, #1
	adds r2, r4, r2
	movs r0, #0
	ldrsh r2, [r2, r0]
	movs r3, #0xa
	str r3, [sp]
	movs r0, #4
	mov r3, sb
	bl Interpolate
	str r0, [r7, #0x2c]
	ldr r2, _08082DD4 @ =gUnknown_08616980
	ldr r1, [sp, #4]
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, #1
	subs r0, r6, r0
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r4, r4, r2
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r3, #0xa
	str r3, [sp]
	movs r0, #4
	mov r3, sb
	bl Interpolate
	str r0, [r7, #0x30]
	mov sl, r5
	cmp r6, #1
	bne _08082E44
	mov r0, sb
	cmp r0, #3
	bgt _08082DE8
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	adds r0, #7
	movs r1, #6
	bl DivRem
	ldr r2, _08082DD8 @ =gUnknown_0861696C
	adds r0, r0, r2
	ldrb r3, [r0]
	adds r3, #2
	lsls r3, r3, #0xc
	ldr r0, _08082DDC @ =0x00000998
	orrs r3, r0
	ldr r1, [r7, #0x2c]
	ldr r0, _08082DE0 @ =0x000001FF
	ands r1, r0
	ldr r2, [r7, #0x30]
	subs r2, #8
	subs r0, #0xff
	orrs r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082DE4 @ =gUnknown_08615C76
	bl PutSpriteExt
	b _08082E94
	.align 2, 0
_08082DCC: .4byte gSinLut
_08082DD0: .4byte gUnknown_08616972
_08082DD4: .4byte gUnknown_08616980
_08082DD8: .4byte gUnknown_0861696C
_08082DDC: .4byte 0x00000998
_08082DE0: .4byte 0x000001FF
_08082DE4: .4byte gUnknown_08615C76
_08082DE8:
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #7
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #7
	movs r1, #6
	bl DivRem
	ldr r2, _08082E38 @ =gUnknown_0861696C
	adds r4, r4, r2
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xec
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	ldr r1, [r7, #0x2c]
	ldr r0, _08082E3C @ =0x000001FF
	ands r1, r0
	ldr r2, [r7, #0x30]
	subs r0, #0xff
	orrs r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082E40 @ =gUnknown_08615C84
	bl PutSpriteExt
	b _08082E94
	.align 2, 0
_08082E38: .4byte gUnknown_0861696C
_08082E3C: .4byte 0x000001FF
_08082E40: .4byte gUnknown_08615C84
_08082E44:
	mov r2, r8
	ldrh r0, [r2]
	adds r5, r6, #6
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r3, r8
	ldrh r0, [r3]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	ldr r1, _08082EA0 @ =gUnknown_0861696C
	adds r4, r4, r1
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	ldr r1, [r7, #0x2c]
	ldr r0, _08082EA4 @ =0x000001FF
	ands r1, r0
	ldr r2, [r7, #0x30]
	movs r0, #0xff
	ands r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082EA8 @ =gUnknown_08615C84
	bl PutSprite
_08082E94:
	mov r6, sl
	cmp r6, #4
	bgt _08082E9C
	b _08082D36
_08082E9C:
	b _08083018
	.align 2, 0
_08082EA0: .4byte gUnknown_0861696C
_08082EA4: .4byte 0x000001FF
_08082EA8: .4byte gUnknown_08615C84
_08082EAC:
	movs r6, #0
	adds r3, r7, #0
	adds r3, #0x52
	str r3, [sp, #0xc]
	str r1, [sp, #8]
	mov r8, r3
_08082EB8:
	ldr r2, _08082F4C @ =gUnknown_08616972
	ldr r1, [sp, #8]
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, #1
	subs r0, r6, r0
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r5, r6, #1
	lsls r4, r5, #1
	adds r2, r4, r2
	movs r0, #0
	ldrsh r2, [r2, r0]
	movs r3, #0xa
	str r3, [sp]
	movs r0, #4
	mov r3, sb
	bl Interpolate
	str r0, [r7, #0x2c]
	ldr r2, _08082F50 @ =gUnknown_08616980
	ldr r1, [sp, #8]
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, #1
	subs r0, r6, r0
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r4, r4, r2
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r3, #0xa
	str r3, [sp]
	movs r0, #4
	mov r3, sb
	bl Interpolate
	str r0, [r7, #0x30]
	mov sl, r5
	cmp r6, #2
	bne _08082FC0
	mov r0, sb
	cmp r0, #3
	bgt _08082F64
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	adds r0, #8
	movs r1, #6
	bl DivRem
	ldr r2, _08082F54 @ =gUnknown_0861696C
	adds r0, r0, r2
	ldrb r3, [r0]
	adds r3, #2
	lsls r3, r3, #0xc
	ldr r0, _08082F58 @ =0x00000998
	orrs r3, r0
	ldr r1, [r7, #0x2c]
	ldr r0, _08082F5C @ =0x000001FF
	ands r1, r0
	ldr r2, [r7, #0x30]
	subs r2, #8
	subs r0, #0xff
	orrs r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082F60 @ =gUnknown_08615C76
	bl PutSpriteExt
	b _08083010
	.align 2, 0
_08082F4C: .4byte gUnknown_08616972
_08082F50: .4byte gUnknown_08616980
_08082F54: .4byte gUnknown_0861696C
_08082F58: .4byte 0x00000998
_08082F5C: .4byte 0x000001FF
_08082F60: .4byte gUnknown_08615C76
_08082F64:
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #8
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #8
	movs r1, #6
	bl DivRem
	ldr r2, _08082FB4 @ =gUnknown_0861696C
	adds r4, r4, r2
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xec
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	ldr r1, [r7, #0x2c]
	ldr r0, _08082FB8 @ =0x000001FF
	ands r1, r0
	ldr r2, [r7, #0x30]
	subs r0, #0xff
	orrs r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08082FBC @ =gUnknown_08615C84
	bl PutSpriteExt
	b _08083010
	.align 2, 0
_08082FB4: .4byte gUnknown_0861696C
_08082FB8: .4byte 0x000001FF
_08082FBC: .4byte gUnknown_08615C84
_08082FC0:
	mov r2, r8
	ldrh r0, [r2]
	adds r5, r6, #6
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	mov r3, r8
	ldrh r0, [r3]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	ldr r1, _08083028 @ =gUnknown_0861696C
	adds r4, r4, r1
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	ldr r1, [r7, #0x2c]
	ldr r0, _0808302C @ =0x000001FF
	ands r1, r0
	ldr r2, [r7, #0x30]
	movs r0, #0xff
	ands r2, r0
	str r3, [sp]
	movs r0, #2
	ldr r3, _08083030 @ =gUnknown_08615C84
	bl PutSprite
_08083010:
	mov r6, sl
	cmp r6, #5
	bgt _08083018
	b _08082EB8
_08083018:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083028: .4byte gUnknown_0861696C
_0808302C: .4byte 0x000001FF
_08083030: .4byte gUnknown_08615C84

