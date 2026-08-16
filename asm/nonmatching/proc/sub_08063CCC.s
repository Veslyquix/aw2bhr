	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063CCC
sub_08063CCC: @ 0x08063CCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r1
	adds r6, r2, #0
	mov sl, r3
	ldr r7, [sp, #0x30]
	lsls r0, r0, #9
	movs r5, #0x80
	lsls r5, r5, #2
	subs r4, r5, r6
	adds r1, r4, #0
	bl __divsi3
	adds r0, #0x78
	mov r8, r0
	mov r1, sb
	lsls r0, r1, #9
	adds r1, r4, #0
	bl __divsi3
	adds r0, #0x50
	mov sb, r0
	lsls r0, r6, #1
	adds r0, r0, r6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r6, r0, r1
	cmp r6, r5
	ble _08063D24
	ldr r0, _08063D20 @ =gUnknown_0858081C
	mov r2, sl
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #4]
	lsls r0, r7, #0x14
	b _08063D4A
	.align 2, 0
_08063D20: .4byte gUnknown_0858081C
_08063D24:
	cmp r6, r1
	bne _08063D3C
	ldr r2, _08063D38 @ =gUnknown_085806EA
	lsls r3, r7, #2
	mov r0, r8
	mov r1, sb
	bl sub_0801BD00
	b _08063DC4
	.align 2, 0
_08063D38: .4byte gUnknown_085806EA
_08063D3C:
	ldr r0, _08063DD4 @ =gUnknown_0858085C
	mov r2, sl
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #4]
	lsls r0, r7, #0x12
_08063D4A:
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r4, _08063DD8 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	adds r1, r6, #0
	cmp r6, #0
	bne _08063D62
	movs r1, #2
_08063D62:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	adds r1, r6, #0
	cmp r6, #0
	bne _08063D7E
	movs r1, #2
_08063D7E:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r4, #4
	adds r1, r6, #0
	cmp r6, #0
	bne _08063D90
	movs r1, #2
_08063D90:
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r1, r6, #0
	cmp r1, #0
	bne _08063DA0
	movs r1, #2
_08063DA0:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sl
	ldr r1, [sp, #0xc]
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r0, r8
	mov r1, sb
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	bl sub_0801BD00
_08063DC4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063DD4: .4byte gUnknown_0858085C
_08063DD8: .4byte gSinLut

