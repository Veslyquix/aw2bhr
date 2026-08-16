	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F000
sub_0806F000: @ 0x0806F000
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	movs r4, #0
	cmp r6, #0
	beq _0806F054
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _0806F018
	movs r4, #0x10
_0806F018:
	ldr r5, _0806F05C @ =gUnknown_08499578
	ldr r0, [r5]
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	movs r2, #2
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #0x10
	movs r3, #0x10
	bl sub_08012BC8
	asrs r4, r4, #0x10
	ldr r2, [r5]
	ldr r1, _0806F060 @ =gUnknown_08582764
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_08014668
	bl sub_08013AEC
_0806F054:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F05C: .4byte gUnknown_08499578
_0806F060: .4byte gUnknown_08582764

