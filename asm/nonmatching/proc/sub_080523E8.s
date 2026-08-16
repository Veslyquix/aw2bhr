	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080523E8
sub_080523E8: @ 0x080523E8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _080524AC @ =gUnknown_0300453C
	mov r2, r8
	strh r2, [r0]
	ldr r0, _080524B0 @ =gUnknown_0300451C
	strh r1, [r0]
	lsls r5, r1, #1
	ldr r0, _080524B4 @ =gUnknown_085536EC
	ldr r4, _080524B8 @ =gUnknown_02029808
	movs r1, #0x6c
	mov r6, r8
	muls r6, r1, r6
	adds r1, r6, r4
	ldrh r3, [r1, #0x2e]
	lsls r3, r3, #2
	adds r3, r3, r6
	adds r1, r4, #0
	adds r1, #0x44
	adds r1, r3, r1
	ldr r2, [r1]
	adds r1, r4, #0
	adds r1, #0x58
	adds r3, r3, r1
	ldr r3, [r3]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	bl sub_08015410
	adds r5, r5, r6
	adds r4, #0x24
	adds r5, r5, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #1
	bl sub_08015504
	movs r0, #0x3b
	bl sub_08070544
	movs r0, #0x3c
	bl sub_08070544
	movs r0, #0x51
	bl sub_0803B48C
	ldr r1, _080524BC @ =gUnknown_08553B14
	mov r2, r8
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08016824
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl sub_08016944
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080157A4
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_080157F4
	mov r0, r8
	mov r1, sb
	bl sub_08052818
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080524AC: .4byte gUnknown_0300453C
_080524B0: .4byte gUnknown_0300451C
_080524B4: .4byte gUnknown_085536EC
_080524B8: .4byte gUnknown_02029808
_080524BC: .4byte gUnknown_08553B14

