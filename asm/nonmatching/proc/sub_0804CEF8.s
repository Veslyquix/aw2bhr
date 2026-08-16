	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804CEF8
sub_0804CEF8: @ 0x0804CEF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _0804CFC4 @ =gUnknown_0300453C
	mov r1, sl
	strh r1, [r0]
	ldr r2, _0804CFC8 @ =gUnknown_0300451C
	ldr r1, _0804CFCC @ =gUnknown_08552148
	mov r3, sl
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r4, _0804CFD0 @ =gUnknown_03004580
	lsls r5, r3, #4
	adds r0, r5, r4
	ldrh r0, [r0]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #8
	adds r0, r5, r0
	ldrh r0, [r0]
	str r0, [sp, #8]
	mov r0, sl
	bl sub_0804C400
	adds r4, #4
	adds r5, r5, r4
	ldrh r0, [r5]
	cmp r0, #1
	bhi _0804CFEC
	mov r1, sl
	lsls r0, r1, #0xd
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804CFD4 @ =gUnknown_08552178
	mov r3, sl
	lsls r3, r3, #2
	mov sb, r3
	mov r5, sb
	add r5, sl
	lsls r5, r5, #1
	adds r0, #4
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	ldr r0, _0804CFD8 @ =gUnknown_085533E4
	ldr r6, _0804CFDC @ =gUnknown_08557978
	ldr r1, [sp, #4]
	lsls r1, r1, #1
	mov r8, r1
	ldr r3, [sp, #4]
	add r3, r8
	lsls r3, r3, #2
	adds r1, r6, #0
	adds r1, #8
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r6, #4
	adds r3, r3, r1
	ldr r3, [r3]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r4, _0804CFE0 @ =gUnknown_08136068
	ldr r1, [r4]
	adds r1, #4
	adds r5, r5, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	ldr r0, _0804CFE4 @ =gUnknown_08562128
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r1, _0804CFE8 @ =0x06010000
	adds r1, r7, r1
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	b _0804D068
	.align 2, 0
_0804CFC4: .4byte gUnknown_0300453C
_0804CFC8: .4byte gUnknown_0300451C
_0804CFCC: .4byte gUnknown_08552148
_0804CFD0: .4byte gUnknown_03004580
_0804CFD4: .4byte gUnknown_08552178
_0804CFD8: .4byte gUnknown_085533E4
_0804CFDC: .4byte gUnknown_08557978
_0804CFE0: .4byte gUnknown_08136068
_0804CFE4: .4byte gUnknown_08562128
_0804CFE8: .4byte 0x06010000
_0804CFEC:
	mov r3, sl
	lsls r0, r3, #0xd
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804D0D8 @ =gUnknown_08552178
	lsls r3, r3, #2
	mov sb, r3
	mov r5, sb
	add r5, sl
	lsls r5, r5, #1
	adds r0, #4
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	ldr r0, _0804D0DC @ =gUnknown_085533FC
	ldr r6, _0804D0E0 @ =gUnknown_085579B4
	ldr r3, [sp, #4]
	lsls r3, r3, #1
	mov r8, r3
	ldr r3, [sp, #4]
	add r3, r8
	lsls r3, r3, #2
	adds r1, r6, #0
	adds r1, #8
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r6, #4
	adds r3, r3, r1
	ldr r3, [r3]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r4, _0804D0E4 @ =gUnknown_08136068
	ldr r1, [r4]
	adds r1, #4
	adds r5, r5, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	ldr r0, _0804D0E8 @ =gUnknown_08562128
	ldr r1, [sp, #8]
	adds r0, r1, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r1, _0804D0EC @ =0x06010000
	adds r1, r7, r1
	movs r2, #0xa0
	lsls r2, r2, #2
	bl CpuFastSet
_0804D068:
	mov r7, sb
	mov r5, r8
	mov sb, r4
	ldr r6, _0804D0F0 @ =gUnknown_085579F0
	ldr r2, [sp, #4]
	adds r5, r5, r2
	lsls r5, r5, #2
	adds r0, r5, r6
	ldr r0, [r0]
	ldr r1, _0804D0F4 @ =gUnknown_08552FB0
	adds r1, r7, r1
	ldr r1, [r1]
	bl Decompress
	ldr r0, _0804D0D8 @ =gUnknown_08552178
	add r7, sl
	mov r8, r7
	mov r3, r8
	lsls r3, r3, #1
	mov r8, r3
	adds r0, #6
	add r0, r8
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	ldr r0, _0804D0F8 @ =gUnknown_08553414
	adds r1, r6, #0
	adds r1, #8
	adds r1, r5, r1
	ldr r2, [r1]
	adds r6, #4
	adds r5, r5, r6
	ldr r3, [r5]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	mov r2, sb
	ldr r1, [r2]
	adds r1, #6
	add r8, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, r8
	strh r0, [r3]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D0D8: .4byte gUnknown_08552178
_0804D0DC: .4byte gUnknown_085533FC
_0804D0E0: .4byte gUnknown_085579B4
_0804D0E4: .4byte gUnknown_08136068
_0804D0E8: .4byte gUnknown_08562128
_0804D0EC: .4byte 0x06010000
_0804D0F0: .4byte gUnknown_085579F0
_0804D0F4: .4byte gUnknown_08552FB0
_0804D0F8: .4byte gUnknown_08553414

