	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805634C
sub_0805634C: @ 0x0805634C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	cmp r2, #0
	bne _0805636C
	b _0805647E
_0805636C:
	mov r0, r8
	adds r1, r6, #0
	bl sub_0805653C
	mov r8, r0
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, r8
	bl sub_080564B8
	ldr r1, _08056490 @ =gUnknown_08551E64
	ldr r3, _08056494 @ =gUnknown_030045A0
	ldr r2, _08056498 @ =gUnknown_0300450C
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	movs r4, #0
	cmp r4, r8
	bhs _080563F0
	movs r0, #0x6c
	adds r1, r6, #0
	muls r1, r0, r1
	mov sb, r1
	lsls r7, r6, #1
	mov ip, r2
	movs r1, #1
	adds r0, r6, #0
	eors r0, r1
	lsls r0, r0, #1
	adds r5, r0, r3
_080563B2:
	lsls r3, r4, #1
	add r3, sb
	ldr r2, _0805649C @ =gUnknown_02029822
	adds r3, r3, r2
	mov r1, ip
	ldrh r0, [r1]
	adds r0, r7, r0
	lsls r0, r0, #1
	ldr r2, _080564A0 @ =gUnknown_08551E7C
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r1, r1, r4
	lsls r1, r1, #1
	add r1, sl
	ldrh r2, [r5]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r2, _080564A4 @ =gUnknown_08551D2A
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r8
	blo _080563B2
_080563F0:
	movs r4, #0
	cmp r4, r8
	bhs _08056478
	lsls r1, r6, #3
	movs r0, #0x6c
	adds r3, r6, #0
	muls r3, r0, r3
	str r3, [sp]
	ldr r0, _080564A8 @ =gUnknown_020298E0
	mov sl, r0
	adds r1, r1, r6
	lsls r1, r1, #4
	str r1, [sp, #4]
_0805640A:
	movs r5, #0
	lsls r0, r4, #1
	adds r4, #1
	mov sb, r4
	ldr r1, [sp]
	adds r0, r0, r1
	ldr r2, _080564AC @ =gUnknown_0202980A
	adds r2, r2, r0
	mov ip, r2
	ldr r3, _0805649C @ =gUnknown_02029822
	adds r7, r0, r3
	movs r1, #1
	adds r0, r6, #0
	eors r0, r1
	lsls r0, r0, #1
	ldr r1, _08056494 @ =gUnknown_030045A0
	adds r4, r0, r1
_0805642C:
	lsls r0, r5, #1
	ldr r2, [sp, #4]
	adds r3, r0, r2
	mov r0, sl
	adds r0, #0x1a
	adds r0, r3, r0
	mov r2, ip
	ldrh r1, [r2]
	ldrh r0, [r0]
	cmp r1, r0
	bne _08056464
	ldr r0, _080564B0 @ =gUnknown_020298EC
	adds r3, r3, r0
	ldrh r0, [r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r2, _080564B4 @ =gUnknown_08551D22
	adds r2, #6
	adds r2, r1, r2
	ldrh r0, [r3]
	ldrh r2, [r2]
	ldr r3, _080564A4 @ =gUnknown_08551D2A
	adds r1, r1, r3
	subs r0, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r7]
_08056464:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0805642C
	mov r1, sb
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r8
	blo _0805640A
_08056478:
	adds r0, r6, #0
	bl sub_08056638
_0805647E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056490: .4byte gUnknown_08551E64
_08056494: .4byte gUnknown_030045A0
_08056498: .4byte gUnknown_0300450C
_0805649C: .4byte gUnknown_02029822
_080564A0: .4byte gUnknown_08551E7C
_080564A4: .4byte gUnknown_08551D2A
_080564A8: .4byte gUnknown_020298E0
_080564AC: .4byte gUnknown_0202980A
_080564B0: .4byte gUnknown_020298EC
_080564B4: .4byte gUnknown_08551D22

