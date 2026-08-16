	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029D3C
sub_08029D3C: @ 0x08029D3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	ldr r1, _08029DB0 @ =gUnknown_03003F40
	movs r0, #0
	str r0, [r1]
	movs r5, #0
	adds r2, r1, #0
	ldr r7, _08029DB4 @ =gUnknown_03003100
	ldr r6, _08029DB8 @ =gUnknown_0849A0D8
_08029D54:
	lsls r4, r5, #1
	adds r4, r4, r5
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	ldrh r1, [r7]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #2
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	ldrh r3, [r7, #2]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r2, [sp]
	bl sub_0804209C
	lsls r4, r4, #1
	adds r4, r4, r6
	movs r3, #0
	ldrsh r1, [r4, r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	muls r1, r0, r1
	ldr r2, [sp]
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _08029D54
	movs r0, #0
	mov r1, r8
	strh r0, [r1, #0x1e]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029DB0: .4byte gUnknown_03003F40
_08029DB4: .4byte gUnknown_03003100
_08029DB8: .4byte gUnknown_0849A0D8

