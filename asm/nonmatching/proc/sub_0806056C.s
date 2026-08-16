	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806056C
sub_0806056C: @ 0x0806056C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	ldr r1, _080605E0 @ =gUnknown_030045E0
	lsls r0, r4, #2
	adds r7, r0, r1
	movs r0, #0
	str r0, [r7]
	ldr r0, _080605E4 @ =gUnknown_030046C0
	adds r0, #6
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #5
	bne _080605F8
	ldr r2, _080605E8 @ =gUnknown_08499594
	ldr r0, _080605EC @ =gUnknown_030040D8
	ldr r3, [r0]
	adds r0, r3, #7
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r6, r2, r0
	ldr r4, _080605F0 @ =gUnknown_03003110
	movs r0, #0xa
	strb r0, [r4]
	movs r0, #4
	strb r0, [r4, #1]
	ldr r1, _080605F4 @ =gUnknown_03003100
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	subs r3, r3, r2
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r3, r2, #4
	adds r2, r2, r3
	lsls r3, r2, #8
	adds r2, r2, r3
	lsls r3, r2, #0x10
	adds r2, r2, r3
	rsbs r2, r2, #0
	asrs r2, r2, #2
	movs r3, #0xc0
	ands r2, r3
	lsrs r2, r2, #6
	ldrb r3, [r6]
	str r4, [sp]
	bl sub_080357E0
	str r0, [r7]
	b _08060660
	.align 2, 0
_080605E0: .4byte gUnknown_030045E0
_080605E4: .4byte gUnknown_030046C0
_080605E8: .4byte gUnknown_08499594
_080605EC: .4byte gUnknown_030040D8
_080605F0: .4byte gUnknown_03003110
_080605F4: .4byte gUnknown_03003100
_080605F8:
	cmp r0, #0
	beq _08060660
	ldr r0, _0806066C @ =gUnknown_03003F40
	ldrb r5, [r1]
	subs r5, #1
	str r5, [r0]
	ldr r2, _08060670 @ =gUnknown_08499594
	ldr r0, _08060674 @ =gUnknown_030040D8
	ldr r3, [r0]
	adds r0, r3, #7
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r6, r2, r0
	ldr r1, _08060678 @ =gUnknown_03003100
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	subs r3, r3, r2
	lsls r2, r3, #2
	adds r2, r2, r3
	lsls r3, r2, #4
	adds r2, r2, r3
	lsls r3, r2, #8
	adds r2, r2, r3
	lsls r3, r2, #0x10
	adds r2, r2, r3
	rsbs r2, r2, #0
	asrs r2, r2, #2
	movs r3, #0xc0
	ands r2, r3
	lsrs r2, r2, #6
	ldrb r3, [r6]
	ldr r4, _0806067C @ =gUnknown_08576900
	lsls r5, r5, #1
	adds r5, r5, r4
	str r5, [sp]
	bl sub_080357E0
	str r0, [r7]
	mov r0, r8
	bl sub_080428F0
	ldr r1, _08060680 @ =gUnknown_03004774
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r6]
	bl sub_08029868
_08060660:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806066C: .4byte gUnknown_03003F40
_08060670: .4byte gUnknown_08499594
_08060674: .4byte gUnknown_030040D8
_08060678: .4byte gUnknown_03003100
_0806067C: .4byte gUnknown_08576900
_08060680: .4byte gUnknown_03004774

