	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080436DC
sub_080436DC: @ 0x080436DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r0, _08043730 @ =gUnknown_030005D0
	strh r5, [r0]
	ldr r1, _08043734 @ =gUnknown_08091370
	ldr r0, [r1]
	ldrb r0, [r0, #0xd]
	mov sb, r1
	ldr r6, _08043738 @ =gUnknown_08091374
	cmp r0, #0
	beq _08043744
	ldr r0, [r6]
	ldr r1, [r0]
	lsls r2, r5, #4
	subs r0, r2, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08043744
	adds r0, r7, #0
	adds r0, #0x34
	ldr r2, _0804373C @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	mov r1, r8
	adds r1, #3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08043740 @ =gUnknown_0809136C
	bl sub_080119A0
	b _08043768
	.align 2, 0
_08043730: .4byte gUnknown_030005D0
_08043734: .4byte gUnknown_08091370
_08043738: .4byte gUnknown_08091374
_0804373C: .4byte 0x000001FF
_08043740: .4byte gUnknown_0809136C
_08043744:
	adds r0, r7, #0
	adds r0, #0x34
	ldr r2, _080437D8 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	mov r1, r8
	adds r1, #3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [r6]
	ldr r3, [r2]
	lsls r4, r5, #4
	subs r2, r4, r5
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_0802BD54
_08043768:
	ldr r3, _080437DC @ =gUnknown_084A0032
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	mov r2, r8
	bl PutSprite
	ldr r3, _080437E0 @ =gUnknown_084A003A
	ldr r0, _080437E4 @ =0x0000E03A
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	mov r2, r8
	bl PutSprite
	ldr r6, [r6]
	ldr r0, [r6]
	subs r1, r4, r5
	lsls r4, r1, #2
	adds r0, r4, r0
	ldrb r0, [r0, #0x1d]
	movs r1, #0x1e
	bl sub_08043AA0
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #3
	ldr r1, _080437E8 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _080437EC @ =gUnknown_08102F64
	adds r0, r0, r1
	ldr r1, _080437F0 @ =0x06010740
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
	mov r1, sb
	ldr r0, [r1]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _080437FE
	ldr r0, [r6]
	adds r0, r4, r0
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	beq _080437F4
	adds r0, r7, #0
	mov r1, r8
	adds r2, r5, #0
	bl sub_08043898
	b _080437FE
	.align 2, 0
_080437D8: .4byte 0x000001FF
_080437DC: .4byte gUnknown_084A0032
_080437E0: .4byte gUnknown_084A003A
_080437E4: .4byte 0x0000E03A
_080437E8: .4byte 0x000003FF
_080437EC: .4byte gUnknown_08102F64
_080437F0: .4byte 0x06010740
_080437F4:
	adds r0, r7, #0
	mov r1, r8
	adds r2, r5, #0
	bl sub_080438FC
_080437FE:
	adds r0, r5, #0
	bl sub_080442E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043826
	adds r0, r5, #0
	bl sub_08044280
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043820
	movs r0, #0xf0
	lsls r0, r0, #1
	bl sub_0803B4DC
	b _08043826
_08043820:
	movs r0, #0x75
	bl sub_0803B4DC
_08043826:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

