	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026040
sub_08026040: @ 0x08026040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	str r1, [sp]
	mov r8, r2
	mov sb, r3
	cmp r0, #1
	bne _08026064
	cmp r1, #2
	bne _08026064
	cmp r2, #3
	bne _08026064
	cmp r3, #4
	beq _080260BC
_08026064:
	movs r0, #0xc0
	lsls r0, r0, #4
	bl sub_08014E44
	str r0, [sp, #4]
	ldr r4, _080260CC @ =gUnknown_02022684
	adds r2, r0, #0
	movs r3, #0xff
_08026074:
	adds r1, r2, #0
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	adds r4, #0xc
	adds r2, #0xc
	subs r3, #1
	cmp r3, #0
	bge _08026074
	ldr r0, [sp, #4]
	mov r1, sl
	bl sub_080260D0
	ldr r1, [sp, #4]
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r1, [sp]
	bl sub_080260D0
	ldr r5, [sp, #4]
	movs r6, #0xc0
	lsls r6, r6, #3
	adds r0, r5, r6
	mov r1, r8
	bl sub_080260D0
	movs r7, #0x90
	lsls r7, r7, #4
	adds r0, r5, r7
	mov r1, sb
	bl sub_080260D0
	ldr r0, [sp, #4]
	bl sub_08014ED4
_080260BC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080260CC: .4byte gUnknown_02022684

