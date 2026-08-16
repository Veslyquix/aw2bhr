	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802216C
sub_0802216C: @ 0x0802216C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r0, [sp, #0x34]
	ldr r4, [sp, #0x38]
	ldr r5, [sp, #0x3c]
	ldr r6, [sp, #0x40]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	mov ip, r2
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #4]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #8]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	str r6, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bne _080221C4
	ldr r0, _080221BC @ =gUnknown_03003F2C
	ldrh r2, [r0]
	ldr r0, _080221C0 @ =gUnknown_0809097C
	b _080221D0
	.align 2, 0
_080221BC: .4byte gUnknown_03003F2C
_080221C0: .4byte gUnknown_0809097C
_080221C4:
	ldr r1, _08022228 @ =gUnknown_0809097C
	mov r3, ip
	lsrs r0, r3, #0x16
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
_080221D0:
	ldrh r5, [r0]
	mov r0, sb
	cmp r0, #0
	beq _080221DC
	movs r1, #1
	mov sb, r1
_080221DC:
	lsrs r4, r2, #6
	adds r0, r4, #1
	mov r1, sl
	str r2, [sp, #0x10]
	bl sub_080261A4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq _080221F6
	cmp r2, #0x80
	bne _080222CA
_080221F6:
	adds r0, r6, #1
	adds r0, r5, r0
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
	add r0, r8
	strh r0, [r7]
	adds r0, r6, r5
	add r0, r8
	strh r0, [r7, #2]
	ldr r0, _0802222C @ =gUnknown_030033EC
	ldrh r1, [r0]
	adds r2, r4, #1
	mov r0, sl
	bl sub_0802706C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022230
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x79
	b _0802226A
	.align 2, 0
_08022228: .4byte gUnknown_0809097C
_0802222C: .4byte gUnknown_030033EC
_08022230:
	mov r3, sb
	cmp r3, #0
	beq _08022240
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x76
	b _0802226A
_08022240:
	ldr r0, [sp]
	cmp r0, #0
	beq _08022250
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x77
	b _0802226A
_08022250:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _08022260
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x78
	b _0802226A
_08022260:
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r6, #3
	adds r0, r5, r0
	add r0, r8
_0802226A:
	strh r0, [r1]
	ldr r0, _08022294 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x58
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08022298
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _08022298
	adds r1, r7, #0
	adds r1, #0x42
	adds r0, r5, #0
	adds r0, #0x7a
	b _08022388
	.align 2, 0
_08022294: .4byte gUnknown_08499598
_08022298:
	ldr r0, _080222B4 @ =gUnknown_08090986
	ldr r3, [sp, #4]
	lsls r1, r3, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080222BC
	adds r1, r7, #0
	adds r1, #0x42
	adds r0, r6, r5
	ldr r3, _080222B8 @ =0x00000402
	adds r0, r0, r3
	b _08022388
	.align 2, 0
_080222B4: .4byte gUnknown_08090986
_080222B8: .4byte 0x00000402
_080222BC:
	adds r1, r7, #0
	adds r1, #0x42
	adds r0, r5, #0
	adds r0, #0x6c
	ldr r2, [sp, #4]
	adds r0, r2, r0
	b _08022388
_080222CA:
	adds r0, r6, r5
	strh r0, [r7]
	adds r0, r5, #1
	adds r0, r6, r0
	strh r0, [r7, #2]
	ldr r0, _080222F0 @ =gUnknown_030033EC
	ldrh r1, [r0]
	adds r2, r4, #1
	mov r0, sl
	bl sub_0802706C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080222F4
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x79
	b _0802232C
	.align 2, 0
_080222F0: .4byte gUnknown_030033EC
_080222F4:
	mov r3, sb
	cmp r3, #0
	beq _08022304
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x76
	b _0802232C
_08022304:
	ldr r0, [sp]
	cmp r0, #0
	beq _08022314
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x77
	b _0802232C
_08022314:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _08022324
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #0
	adds r0, #0x78
	b _0802232C
_08022324:
	adds r1, r7, #0
	adds r1, #0x40
	adds r0, r5, #2
	adds r0, r6, r0
_0802232C:
	strh r0, [r1]
	ldr r0, _08022358 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x58
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802235C
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0802235C
	adds r1, r7, #0
	adds r1, #0x42
	adds r0, r5, #0
	adds r0, #0x7a
	b _08022388
	.align 2, 0
_08022358: .4byte gUnknown_08499598
_0802235C:
	ldr r0, _08022378 @ =gUnknown_08090986
	ldr r3, [sp, #4]
	lsls r1, r3, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0802237C
	adds r1, r7, #0
	adds r1, #0x42
	adds r0, r5, #3
	adds r0, r6, r0
	b _08022388
	.align 2, 0
_08022378: .4byte gUnknown_08090986
_0802237C:
	adds r1, r7, #0
	adds r1, #0x42
	adds r0, r5, #0
	adds r0, #0x6c
	ldr r3, [sp, #4]
	adds r0, r3, r0
_08022388:
	strh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

