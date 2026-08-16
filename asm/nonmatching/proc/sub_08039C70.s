	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039C70
sub_08039C70: @ 0x08039C70
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldrh r1, [r5, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	subs r0, r0, r1
	cmp r0, #0
	bge _08039C8C
	adds r0, #3
_08039C8C:
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r4, _08039D28 @ =gSinLut
	adds r1, r4, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r7, r1, #4
	lsls r0, r0, #0x10
	movs r1, #2
	cmp r0, #0
	beq _08039CAA
	ldrh r1, [r5, #0x2e]
_08039CAA:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	ldrsh r4, [r4, r3]
	rsbs r0, r4, #0
	lsls r2, r0, #4
	ldrh r0, [r5, #0x2e]
	movs r1, #2
	cmp r0, #0
	beq _08039CC8
	adds r1, r0, #0
_08039CC8:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r2, r4, #4
	ldrh r0, [r5, #0x2e]
	movs r1, #2
	cmp r0, #0
	beq _08039CDE
	adds r1, r0, #0
_08039CDE:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldrh r0, [r5, #0x2e]
	movs r1, #2
	cmp r0, #0
	beq _08039CF2
	adds r1, r0, #0
_08039CF2:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldrh r0, [r5, #0x2e]
	cmp r0, #0xf9
	bls _08039D2C
	movs r0, #0
	strh r0, [r5, #0x2e]
	movs r3, #0x32
	ldrsh r0, [r5, r3]
	bl sub_0801DAE8
	adds r0, r5, #0
	bl Proc_Break
	b _08039D84
	.align 2, 0
_08039D28: .4byte gSinLut
_08039D2C:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08039D94 @ =gUnknown_08499590
	ldr r2, [r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r6, r0, #0
	adds r6, #8
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r3, #6
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	adds r4, #8
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x40
	bl sub_0801306C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039D84
	ldr r0, _08039D98 @ =0x000001FF
	ands r6, r0
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	lsls r0, r0, #9
	orrs r6, r0
	movs r0, #0xff
	ands r4, r0
	mov r2, sb
	orrs r4, r2
	ldr r2, _08039D9C @ =gUnknown_0849D824
	ldrh r3, [r5, #0x2c]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0801BD00
_08039D84:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039D94: .4byte gUnknown_08499590
_08039D98: .4byte 0x000001FF
_08039D9C: .4byte gUnknown_0849D824

