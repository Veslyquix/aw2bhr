	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804E334
sub_0804E334: @ 0x0804E334
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov r4, sp
	adds r0, r7, #0
	mov r1, sp
	bl sub_0801566C
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r0, r1, #0x16
	mov r2, r8
	ldrh r4, [r2, #4]
	subs r6, r4, r0
	ldr r3, _0804E3A8 @ =0x000003FF
	adds r0, r3, #0
	ands r6, r0
	ldr r3, _0804E3AC @ =gUnknown_03001470
	lsls r2, r7, #1
	adds r2, r2, r7
	lsls r2, r2, #5
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r2, r0
	ldrh r5, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r4
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	adds r3, #0x28
	adds r2, r2, r3
	ldr r0, [r2]
	cmp r6, r0
	beq _0804E39C
	ldr r0, _0804E3B0 @ =gUnknown_02029668
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r0, #6
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r7, r0
	bne _0804E39C
	str r6, [r2]
_0804E39C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E3A8: .4byte 0x000003FF
_0804E3AC: .4byte gUnknown_03001470
_0804E3B0: .4byte gUnknown_02029668

