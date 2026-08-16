	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A368
sub_0801A368: @ 0x0801A368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	str r2, [sp, #4]
	mov r8, r3
	ldr r0, [sp, #0x30]
	mov sl, r0
	ldr r2, [sp, #8]
	lsls r0, r2, #1
	ldr r7, [sp, #0x2c]
	adds r0, r7, r0
	lsls r1, r1, #6
	adds r4, r0, r1
	ldr r0, [sp, #4]
	lsls r0, r0, #0x10
	mov sb, r0
	asrs r2, r0, #0x10
	adds r0, r4, #0
	ldr r1, [sp, #8]
	mov r3, sl
	bl sub_0801A1D8
	adds r4, #0x40
	movs r6, #1
	movs r5, #0
	b _0801A3C8
_0801A3A4:
	lsls r3, r6, #0x10
	asrs r3, r3, #0x10
	mov r1, sl
	str r1, [sp]
	adds r0, r4, #0
	ldr r1, [sp, #8]
	mov r7, sb
	asrs r2, r7, #0x10
	bl sub_0801A240
	adds r4, #0x40
	movs r0, #1
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0801A3C8:
	mov r0, r8
	subs r0, #2
	cmp r5, r0
	blt _0801A3A4
	ldr r0, [sp, #4]
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	ldr r1, [sp, #8]
	mov r3, sl
	bl sub_0801A2E4
	ldr r0, _0801A434 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, [sp, #0x2c]
	cmp r1, r0
	bne _0801A3F0
	movs r0, #0
	bl sub_08013AD4
_0801A3F0:
	ldr r0, _0801A438 @ =gUnknown_0849957C
	ldr r0, [r0]
	ldr r2, [sp, #0x2c]
	cmp r2, r0
	bne _0801A400
	movs r0, #1
	bl sub_08013AD4
_0801A400:
	ldr r0, _0801A43C @ =gUnknown_08499580
	ldr r0, [r0]
	ldr r7, [sp, #0x2c]
	cmp r7, r0
	bne _0801A410
	movs r0, #2
	bl sub_08013AD4
_0801A410:
	ldr r0, _0801A440 @ =gUnknown_08499584
	ldr r0, [r0]
	ldr r1, [sp, #0x2c]
	cmp r1, r0
	bne _0801A420
	movs r0, #3
	bl sub_08013AD4
_0801A420:
	bl sub_0802465C
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A434: .4byte gUnknown_08499578
_0801A438: .4byte gUnknown_0849957C
_0801A43C: .4byte gUnknown_08499580
_0801A440: .4byte gUnknown_08499584

