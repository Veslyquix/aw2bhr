	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800518C
sub_0800518C: @ 0x0800518C
	push {r4, lr}
	sub sp, #8
	ldr r0, _080051CC @ =gUnknown_08499578
	ldr r0, [r0]
	movs r4, #0x14
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0xe
	movs r3, #0x1e
	bl sub_08012BC8
	ldr r0, _080051D0 @ =gUnknown_08499580
	ldr r0, [r0]
	str r4, [sp]
	movs r1, #0xd8
	lsls r1, r1, #2
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x1e
	bl sub_08012BC8
	bl sub_08013AEC
	bl sub_08013B0C
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080051CC: .4byte gUnknown_08499578
_080051D0: .4byte gUnknown_08499580

