	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E780
sub_0806E780: @ 0x0806E780
	push {r4, lr}
	sub sp, #8
	movs r1, #0x10
	ldr r0, [r0, #0x34]
	rsbs r4, r0, #0
	orrs r4, r0
	asrs r4, r4, #0x1f
	ands r4, r1
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r0, _0806E7BC @ =gUnknown_08499578
	ldr r0, [r0]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0x10
	movs r3, #0x10
	bl sub_08012BC8
	bl sub_08013AEC
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E7BC: .4byte gUnknown_08499578

