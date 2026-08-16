	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052270
sub_08052270: @ 0x08052270
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _08052340 @ =gUnknown_03001470
	ldr r0, _08052344 @ =gUnknown_03001FBC
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	movs r3, #0x28
	adds r3, r3, r2
	mov r8, r3
	add r1, r8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	mov r0, sb
	movs r1, #0
	ldrsh r4, [r0, r1]
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #5
	adds r0, r2, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r5, r0, #0
	adds r0, r2, #0
	adds r0, #0x34
	adds r0, r1, r0
	ldrh r6, [r0]
	add r1, r8
	ldr r0, [r1]
	lsls r0, r0, #0x12
	lsrs r3, r0, #0x10
	cmp r5, #0
	bne _080522C6
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080522C6:
	ldr r2, _08052348 @ =gUnknown_02029A10
	lsls r1, r6, #3
	adds r1, r1, r6
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r5, r0
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r0, _0805234C @ =gUnknown_08552D80
	lsls r7, r5, #1
	adds r0, #0x56
	adds r0, r7, r0
	ldrh r2, [r0]
	ldrh r0, [r1, #8]
	adds r2, r2, r0
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xa
	ldrsh r3, [r1, r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08050528
	mov r2, sb
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	add r0, r8
	ldr r0, [r0]
	cmp r0, #8
	bne _08052334
	ldr r2, _08052350 @ =gUnknown_08553B10
	adds r2, r7, r2
	ldr r1, _08052354 @ =gUnknown_02029808
	lsls r4, r6, #1
	movs r0, #0x6c
	muls r0, r5, r0
	adds r4, r4, r0
	adds r1, #0x24
	adds r4, r4, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xc0
	lsls r1, r1, #1
	bl sub_080157F4
_08052334:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052340: .4byte gUnknown_03001470
_08052344: .4byte gUnknown_03001FBC
_08052348: .4byte gUnknown_02029A10
_0805234C: .4byte gUnknown_08552D80
_08052350: .4byte gUnknown_08553B10
_08052354: .4byte gUnknown_02029808

