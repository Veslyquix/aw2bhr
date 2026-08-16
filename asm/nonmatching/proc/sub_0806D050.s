	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D050
sub_0806D050: @ 0x0806D050
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806D0C4 @ =gUnknown_03000618
	mov sb, r0
	ldr r1, _0806D0C8 @ =gUnknown_03004008
	mov r8, r1
	ldr r0, [r1]
	subs r0, #1
	mov r2, sb
	ldr r1, [r2]
	ldr r6, _0806D0CC @ =gUnknown_0816E184
	ldr r7, _0806D0D0 @ =gUnknown_0816E188
	cmp r1, r0
	bne _0806D092
	ldr r0, [r6]
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r0, r4
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	ldr r0, [r7]
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r5
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r5, r0, #1
_0806D092:
	ldr r1, _0806D0D4 @ =0x000001FF
	ands r1, r4
	movs r2, #0xff
	ands r2, r5
	movs r0, #0
	str r0, [sp]
	movs r0, #0x44
	movs r3, #0
	bl sub_0801F34C
	mov r1, r8
	ldr r0, [r1]
	mov r2, sb
	str r0, [r2]
	ldr r0, [r6]
	strh r4, [r0]
	ldr r0, [r7]
	strh r5, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D0C4: .4byte gUnknown_03000618
_0806D0C8: .4byte gUnknown_03004008
_0806D0CC: .4byte gUnknown_0816E184
_0806D0D0: .4byte gUnknown_0816E188
_0806D0D4: .4byte 0x000001FF

