	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A36C
sub_0807A36C: @ 0x0807A36C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0xb0
	lsls r2, r2, #8
	movs r0, #0
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	ldr r0, _0807A3A4 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807A39A
	ldr r0, _0807A3A8 @ =gUnknown_08615E08
	adds r1, r4, #0
	bl Proc_Start
_0807A39A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A3A4: .4byte gUnknown_03002EE0
_0807A3A8: .4byte gUnknown_08615E08

