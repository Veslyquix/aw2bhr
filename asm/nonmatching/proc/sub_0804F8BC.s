	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804F8BC
sub_0804F8BC: @ 0x0804F8BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r6, _0804FA04 @ =gUnknown_03001470
	ldr r5, _0804FA08 @ =gUnknown_081360C4
	ldr r0, [r5]
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r1, r6, #0
	adds r1, #0x30
	adds r1, r2, r1
	ldrh r7, [r1]
	adds r1, r6, #0
	adds r1, #0x34
	adds r2, r2, r1
	ldrh r2, [r2]
	mov sl, r2
	bl sub_080156A0
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r7, #0
	mov r1, sl
	bl sub_08056E9C
	cmp r4, #2
	bne _0804F968
	ldr r2, _0804FA0C @ =gUnknown_02029BA8
	mov sb, r2
	lsls r5, r7, #5
	mov r3, sb
	adds r3, #0x14
	adds r3, r5, r3
	ldr r2, _0804FA10 @ =gUnknown_0200E438
	mov r4, r8
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r6
	ldrh r1, [r0, #0x26]
	movs r0, #0x4c
	muls r0, r1, r0
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	beq _0804F968
	ldr r2, _0804FA14 @ =gUnknown_02029A10
	mov r1, sl
	lsls r0, r1, #3
	add r0, sl
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r7, r1
	adds r0, r0, r1
	adds r4, r0, r2
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804F968
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804F968
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	mov r1, sb
	adds r1, #4
	adds r1, r5, r1
	ldr r1, [r1]
	bl sub_080156E8
_0804F968:
	ldr r4, _0804FA18 @ =gUnknown_03001FBC
	mov r8, r4
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r7, #0
	mov r1, sl
	bl sub_0804BDD8
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r7, #2
	ldr r0, _0804FA1C @ =gUnknown_084C3F78
	adds r0, r6, r0
	ldr r0, [r0]
	mov sb, r0
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_080156C4
	ldr r1, _0804FA14 @ =gUnknown_02029A10
	mov r0, sl
	lsls r5, r0, #3
	add r5, sl
	lsls r5, r5, #2
	movs r0, #0xb4
	muls r0, r7, r0
	adds r5, r5, r0
	adds r5, r5, r1
	ldr r1, _0804FA20 @ =gUnknown_08553B28
	lsls r4, r4, #1
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r4, r4, r1
	ldrh r0, [r4]
	ldrh r1, [r5, #8]
	adds r0, r0, r1
	strh r0, [r5, #8]
	ldr r1, _0804FA24 @ =gUnknown_085644D4
	ldr r0, _0804FA28 @ =gUnknown_02028E5C
	adds r6, r6, r0
	ldrh r0, [r6, #2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r5, #0xa]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r5, #0xa]
	mov r4, r8
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r7, #0
	mov r1, sl
	bl sub_0804EDAC
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #8
	ldrsh r1, [r5, r2]
	ldrh r2, [r5, #0xa]
	mov r4, sb
	ldrh r3, [r4]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FA04: .4byte gUnknown_03001470
_0804FA08: .4byte gUnknown_081360C4
_0804FA0C: .4byte gUnknown_02029BA8
_0804FA10: .4byte gUnknown_0200E438
_0804FA14: .4byte gUnknown_02029A10
_0804FA18: .4byte gUnknown_03001FBC
_0804FA1C: .4byte gUnknown_084C3F78
_0804FA20: .4byte gUnknown_08553B28
_0804FA24: .4byte gUnknown_085644D4
_0804FA28: .4byte gUnknown_02028E5C

