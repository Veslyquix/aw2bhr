	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080265D0
sub_080265D0: @ 0x080265D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r4, #0
	ldr r3, _080266B8 @ =gUnknown_08090A68
	ldr r6, [r3]
	ldr r2, _080266BC @ =gUnknown_08090A6C
	ldr r1, [r2]
	movs r0, #0x5c
	mov r5, r8
	muls r5, r0, r5
	adds r0, r5, #0
	adds r1, r0, r1
	ldrh r0, [r6]
	adds r7, r3, #0
	mov sb, r2
	ldrh r2, [r1, #0x20]
	cmp r0, r2
	bhs _08026654
	movs r4, #0xfa
	lsls r4, r4, #1
	movs r5, #0
	ldrh r1, [r1, #0x20]
	subs r0, r1, r0
	cmp r5, r0
	bge _08026654
	adds r6, r1, #0
_08026616:
	adds r0, r4, #0
	bl __floatsidf
	cmp r4, #0
	bge _08026628
	ldr r2, _080266C0 @ =0x41F00000
	ldr r3, _080266C4 @ =0x00000000
	bl __adddf3
_08026628:
	ldr r2, _080266C8 @ =0x3FF33333
	ldr r3, _080266CC @ =0x33333333
	bl __muldf3
	bl __fixunsdfsi
	adds r4, r0, #0
	lsls r1, r5, #0x10
	movs r5, #0x80
	lsls r5, r5, #9
	adds r1, r1, r5
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, r6, r0
	cmp r1, r0
	bge _08026654
	ldr r0, _080266D0 @ =0x0000270F
	cmp r4, r0
	bls _08026616
	adds r4, r0, #0
_08026654:
	ldr r3, [r7]
	mov r1, sb
	ldr r0, [r1]
	movs r1, #0x5c
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	adds r2, r1, r0
	ldrh r0, [r3]
	ldrh r1, [r2, #0x20]
	cmp r0, r1
	bne _08026670
	movs r4, #0xfa
	lsls r4, r4, #1
_08026670:
	cmp r0, r1
	bls _0802669E
	movs r4, #0xfa
	lsls r4, r4, #1
	movs r5, #0
	ldrh r1, [r3]
	ldrh r0, [r2, #0x20]
	subs r0, r1, r0
	cmp r5, r0
	bge _0802669E
	adds r1, r0, #0
_08026686:
	subs r4, #0x96
	lsls r0, r5, #0x10
	movs r5, #0x80
	lsls r5, r5, #9
	adds r0, r0, r5
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	bge _0802669E
	cmp r4, #0x95
	bhi _08026686
	movs r4, #0
_0802669E:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	mov r0, sl
	bl sub_08026584
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080266B8: .4byte gUnknown_08090A68
_080266BC: .4byte gUnknown_08090A6C
_080266C0: .4byte 0x41F00000
_080266C4: .4byte 0x00000000
_080266C8: .4byte 0x3FF33333
_080266CC: .4byte 0x33333333
_080266D0: .4byte 0x0000270F

