	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080504A8
sub_080504A8: @ 0x080504A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r1, _080504F4 @ =gUnknown_085644A0
	mov r8, r1
	ldr r2, _080504F8 @ =gUnknown_02029808
	movs r1, #0x6c
	adds r4, r0, #0
	muls r4, r1, r4
	adds r5, r4, r2
	ldrh r0, [r5, #0x2e]
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r6, r2, #0
	adds r6, #0x30
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r0, #0xff
	bne _080504FC
	movs r0, #0x3b
	bl sub_08070544
	movs r0, #0x3c
	bl sub_08070544
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B48C
	b _0805051E
	.align 2, 0
_080504F4: .4byte gUnknown_085644A0
_080504F8: .4byte gUnknown_02029808
_080504FC:
	movs r0, #0x3b
	bl sub_08070544
	movs r0, #0x3c
	bl sub_08070544
	ldrh r0, [r5, #0x2e]
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0803B48C
_0805051E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

