	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807774C
sub_0807774C: @ 0x0807774C
	push {lr}
	sub sp, #0x10
	ldr r1, _08077784 @ =gUnknown_08499578
	ldr r2, [r1]
	movs r1, #4
	str r1, [sp]
	ldr r1, _08077788 @ =0x0000FFFF
	str r1, [sp, #4]
	ldrh r0, [r0, #0x30]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #8
	movs r2, #6
	movs r3, #0x16
	bl sub_08077214
	ldr r0, _0807778C @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08077784: .4byte gUnknown_08499578
_08077788: .4byte 0x0000FFFF
_0807778C: .4byte gUnknown_0300064C

