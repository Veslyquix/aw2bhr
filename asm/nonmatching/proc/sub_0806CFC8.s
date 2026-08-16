	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CFC8
sub_0806CFC8: @ 0x0806CFC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806D03C @ =gUnknown_03000610
	mov sb, r0
	ldr r1, _0806D040 @ =gUnknown_03004008
	mov r8, r1
	ldr r0, [r1]
	subs r0, #1
	mov r2, sb
	ldr r1, [r2]
	ldr r6, _0806D044 @ =gUnknown_0816E17C
	ldr r7, _0806D048 @ =gUnknown_0816E180
	cmp r1, r0
	bne _0806D00A
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
_0806D00A:
	ldr r1, _0806D04C @ =0x000001FF
	ands r1, r4
	movs r2, #0xff
	ands r2, r5
	movs r0, #0
	str r0, [sp]
	movs r0, #0x43
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
_0806D03C: .4byte gUnknown_03000610
_0806D040: .4byte gUnknown_03004008
_0806D044: .4byte gUnknown_0816E17C
_0806D048: .4byte gUnknown_0816E180
_0806D04C: .4byte 0x000001FF

