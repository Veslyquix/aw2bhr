	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806530C
sub_0806530C: @ 0x0806530C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _080653F0 @ =gUnknown_085802A4
	ldr r1, _080653F4 @ =gUnknown_0200FC50
	movs r2, #0x8c
	lsls r2, r2, #2
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #0xf
	bl sub_08073304
	movs r6, #0
	ldr r2, _080653F8 @ =gUnknown_08580934
	ldr r0, [r2]
	ldrb r0, [r0, #8]
	cmp r6, r0
	bge _080653DE
	mov sl, r6
	mov r8, r2
	movs r0, #0xc8
	lsls r0, r0, #1
	mov sb, r0
	movs r7, #0
_08065348:
	ldr r0, _080653FC @ =gUnknown_08580B90
	movs r1, #3
	bl sub_080152EC
	adds r5, r0, #0
	strh r6, [r5, #0x1c]
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #2
	adds r0, #0x34
	adds r0, r0, r1
	str r5, [r0]
	adds r0, r5, #0
	adds r0, #0x46
	movs r2, #0
	strb r2, [r0]
	adds r0, r6, #0
	bl sub_08065200
	strh r0, [r5, #0x28]
	mov r0, sl
	strh r0, [r5, #0x38]
	lsls r4, r6, #1
	strh r4, [r5, #0x24]
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r1, r7, r2
	lsls r0, r6, #0xc
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x44
	strh r1, [r0]
	mov r0, r8
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x1c
	adds r0, r0, r6
	ldrb r1, [r0]
	ldr r0, [r2, #0x18]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _08065400 @ =0x000003FF
	mov r2, sb
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08065404 @ =0x06010000
	adds r1, r1, r2
	adds r2, r6, #0
	adds r2, #0x10
	bl sub_08043E3C
	ldr r0, _08065408 @ =gUnknown_08580A08
	movs r1, #3
	bl sub_080152EC
	adds r5, r0, #0
	adds r0, r6, #0
	bl sub_08065200
	adds r1, r0, #0
	adds r1, #8
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl sub_08064D44
	movs r0, #0x24
	add sb, r0
	adds r7, #0x24
	adds r6, #1
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	cmp r6, r0
	blt _08065348
_080653DE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080653F0: .4byte gUnknown_085802A4
_080653F4: .4byte gUnknown_0200FC50
_080653F8: .4byte gUnknown_08580934
_080653FC: .4byte gUnknown_08580B90
_08065400: .4byte 0x000003FF
_08065404: .4byte 0x06010000
_08065408: .4byte gUnknown_08580A08

