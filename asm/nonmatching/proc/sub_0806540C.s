	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806540C
sub_0806540C: @ 0x0806540C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _080654D0 @ =gUnknown_085802A4
	ldr r1, _080654D4 @ =gUnknown_0200FC50
	movs r2, #0x8c
	lsls r2, r2, #2
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #0xf
	bl sub_08073304
	movs r5, #0
	ldr r2, _080654D8 @ =gUnknown_08580934
	ldr r0, [r2]
	ldrb r0, [r0, #8]
	cmp r5, r0
	bge _080654BE
	movs r0, #0
	mov sl, r0
	movs r1, #0
	mov sb, r1
	adds r7, r2, #0
	movs r2, #0xc8
	lsls r2, r2, #1
	mov r8, r2
	movs r6, #0
_0806544E:
	ldr r0, _080654DC @ =gUnknown_08580BC8
	movs r1, #3
	bl sub_080152EC
	adds r4, r0, #0
	strh r5, [r4, #0x1c]
	ldr r0, [r7]
	lsls r1, r5, #2
	adds r0, #0x34
	adds r0, r0, r1
	str r4, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	mov r1, sl
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_08065200
	strh r0, [r4, #0x28]
	mov r2, sb
	strh r2, [r4, #0x38]
	lsls r0, r5, #1
	strh r0, [r4, #0x24]
	movs r0, #0xc8
	lsls r0, r0, #1
	adds r1, r6, r0
	lsls r0, r5, #0xc
	adds r1, r1, r0
	adds r4, #0x44
	strh r1, [r4]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x1c
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, [r2, #0x18]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _080654E0 @ =0x000003FF
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _080654E4 @ =0x06010000
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x10
	bl sub_08043E3C
	movs r0, #0x24
	add r8, r0
	adds r6, #0x24
	adds r5, #1
	ldr r0, [r7]
	ldrb r0, [r0, #8]
	cmp r5, r0
	blt _0806544E
_080654BE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080654D0: .4byte gUnknown_085802A4
_080654D4: .4byte gUnknown_0200FC50
_080654D8: .4byte gUnknown_08580934
_080654DC: .4byte gUnknown_08580BC8
_080654E0: .4byte 0x000003FF
_080654E4: .4byte 0x06010000

