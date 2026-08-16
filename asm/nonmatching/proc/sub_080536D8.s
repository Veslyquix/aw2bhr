	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080536D8
sub_080536D8: @ 0x080536D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r0, #0
	mov sb, r0
	ldr r1, _080537F8 @ =gUnknown_03004548
	lsls r0, r5, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
	cmp r7, #0
	beq _080537D8
	ldr r1, _080537FC @ =gUnknown_02029808
	str r1, [sp]
	movs r0, #0x6c
	adds r2, r5, #0
	muls r2, r0, r2
	mov r8, r2
	adds r6, r1, #0
	add r6, r8
	ldr r3, _08053800 @ =gUnknown_03004580
	str r3, [sp, #4]
	lsls r0, r5, #4
	str r0, [sp, #8]
	adds r0, r3, #0
	adds r0, #0xa
	ldr r1, [sp, #8]
	adds r1, r1, r0
	mov sl, r1
	adds r0, #2
	ldr r2, [sp, #8]
	adds r0, r2, r0
	str r0, [sp, #0xc]
_08053728:
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #1
	add r0, r8
	ldr r1, [sp]
	adds r1, #0x30
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	ldr r3, _08053804 @ =gUnknown_085535C0
	adds r0, r0, r3
	ldr r0, [r0]
	mov ip, r0
	ldrh r0, [r6]
	add r0, sb
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _08053808 @ =gUnknown_0202980A
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r2, _0805380C @ =gUnknown_02029A10
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r5, r0
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r2, [r1]
	ldrb r0, [r1, #1]
	subs r2, r2, r0
	mov r3, sl
	ldrh r0, [r3]
	subs r0, r0, r2
	strh r0, [r3]
	ldrb r0, [r1, #1]
	strb r0, [r1]
	ldr r0, _08053810 @ =gUnknown_0300454C
	strh r4, [r0]
	mov r1, sb
	strh r1, [r0, #2]
	ldrh r2, [r6, #0x2e]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_ip
	ldr r1, _08053814 @ =gUnknown_08552148
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _080537BE
	ldr r2, _08053818 @ =gUnknown_085D6A48
	ldr r0, [sp, #4]
	adds r0, #2
	ldr r3, [sp, #8]
	adds r0, r3, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r2, [r0, #4]
	cmp r2, #1
	bne _080537BE
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	cmp r0, #0
	bne _080537BE
	ldr r1, _0805381C @ =gUnknown_02029B80
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r2, [r0]
_080537BE:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	subs r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	cmp r7, #0
	bne _08053728
_080537D8:
	ldr r2, _080537FC @ =gUnknown_02029808
	movs r0, #0x6c
	adds r1, r5, #0
	muls r1, r0, r1
	adds r1, r1, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080537F8: .4byte gUnknown_03004548
_080537FC: .4byte gUnknown_02029808
_08053800: .4byte gUnknown_03004580
_08053804: .4byte gUnknown_085535C0
_08053808: .4byte gUnknown_0202980A
_0805380C: .4byte gUnknown_02029A10
_08053810: .4byte gUnknown_0300454C
_08053814: .4byte gUnknown_08552148
_08053818: .4byte gUnknown_085D6A48
_0805381C: .4byte gUnknown_02029B80

