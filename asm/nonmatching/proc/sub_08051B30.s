	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08051B30
sub_08051B30: @ 0x08051B30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r3, _08051BDC @ =gUnknown_03001470
	ldr r7, _08051BE0 @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #5
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r2, r0
	ldrh r4, [r0]
	adds r3, #0x34
	adds r2, r2, r3
	ldrh r5, [r2]
	ldr r3, _08051BE4 @ =gUnknown_02029A10
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	movs r2, #0xb4
	muls r2, r4, r2
	adds r0, r0, r2
	adds r0, r0, r3
	movs r3, #8
	ldrsh r2, [r0, r3]
	movs r6, #0xa
	ldrsh r3, [r0, r6]
	adds r0, r4, #0
	bl sub_08050528
	ldr r2, _08051BE8 @ =gUnknown_08136108
	ldr r0, [r2]
	mov r8, r0
	lsls r1, r5, #1
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r6, r0, #2
	adds r1, r1, r6
	mov r0, r8
	adds r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r1]
	mov sb, r2
	cmp r0, #1
	bne _08051BCE
	movs r3, #0
	ldrsh r1, [r7, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08051BB8
	adds r0, r1, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08051BB8
	movs r3, #0
	ldrsh r0, [r7, r3]
	mov r1, r8
	adds r1, #0x1c
	adds r1, r6, r1
	ldr r1, [r1]
	bl sub_080156E8
_08051BB8:
	mov r6, sb
	ldr r2, [r6]
	lsls r1, r5, #1
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r2, #0xc
	adds r1, r1, r2
	movs r0, #0
	strh r0, [r1]
_08051BCE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051BDC: .4byte gUnknown_03001470
_08051BE0: .4byte gUnknown_03001FBC
_08051BE4: .4byte gUnknown_02029A10
_08051BE8: .4byte gUnknown_08136108

