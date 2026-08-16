	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080213AC
sub_080213AC: @ 0x080213AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080213FC @ =gUnknown_08090964
	ldr r1, [r0]
	ldrb r1, [r1, #0xd]
	adds r5, r0, #0
	cmp r1, #0
	beq _08021414
	ldr r0, _08021400 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08021404 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _08021414
	ldr r4, _08021408 @ =gUnknown_08090968
	ldr r2, [r4]
	ldr r0, _0802140C @ =gUnknown_03004070
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08021410 @ =0x00001E42
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	bl sub_08020754
	b _0802143A
	.align 2, 0
_080213FC: .4byte gUnknown_08090964
_08021400: .4byte gUnknown_030033EC
_08021404: .4byte gUnknown_08499598
_08021408: .4byte gUnknown_08090968
_0802140C: .4byte gUnknown_03004070
_08021410: .4byte 0x00001E42
_08021414:
	ldr r4, _0802148C @ =gUnknown_08090968
	ldr r2, [r4]
	ldr r0, _08021490 @ =gUnknown_03004070
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08021494 @ =0x00001E42
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r1, [r5]
	ldrb r2, [r1, #0xd]
	movs r1, #1
	subs r1, r1, r2
	bl sub_080206E4
_0802143A:
	ldr r2, [r4]
	ldr r0, _08021498 @ =gUnknown_03004088
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08021494 @ =0x00001E42
	adds r1, r1, r0
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r4, [r5]
	ldrb r2, [r4, #0xd]
	movs r1, #1
	subs r1, r1, r2
	bl sub_080206E4
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _080214F8
	movs r0, #1
	bl sub_080212AC
	movs r0, #2
	bl sub_080212AC
	movs r0, #3
	bl sub_080212AC
	movs r0, #4
	bl sub_080212AC
	movs r0, #0
	bl sub_0803F5C8
	adds r5, r0, #0
	ldrh r1, [r5, #2]
	movs r0, #0xf0
	lsls r0, r0, #2
	b _080214F2
	.align 2, 0
_0802148C: .4byte gUnknown_08090968
_08021490: .4byte gUnknown_03004070
_08021494: .4byte 0x00001E42
_08021498: .4byte gUnknown_03004088
_0802149C:
	ldrb r2, [r5]
	ldrb r1, [r5, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	ldrb r0, [r5, #1]
	adds r6, r1, r0
	movs r0, #8
	adds r0, r0, r5
	mov sl, r0
	cmp r2, sb
	bge _080214E8
_080214BA:
	ldrb r4, [r5, #1]
	adds r0, r2, #1
	mov r8, r0
	cmp r4, r6
	bge _080214E2
	lsls r7, r2, #0x10
_080214C6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	asrs r0, r7, #0x10
	movs r2, #0
	movs r3, #3
	bl sub_080210C8
	adds r4, #1
	cmp r4, r6
	blt _080214C6
_080214E2:
	mov r2, r8
	cmp r2, sb
	blt _080214BA
_080214E8:
	mov r5, sl
	ldrh r1, [r5, #2]
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r0, r2, #0
_080214F2:
	ands r0, r1
	cmp r0, #0
	bne _0802149C
_080214F8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

