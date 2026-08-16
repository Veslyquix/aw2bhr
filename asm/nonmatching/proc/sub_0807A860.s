	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A860
sub_0807A860: @ 0x0807A860
	push {r4, lr}
	sub sp, #8
	bl sub_0807A908
	ldr r1, _0807A8AC @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r4, [r1, #0x1d]
	bl sub_08078E14
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_0807A3AC
	adds r3, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r0, _0807A8B0 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x41
	str r0, [sp, #4]
	movs r0, #0x10
	movs r1, #0xf
	bl sub_08014740
	adds r0, #0x3a
	movs r1, #2
	strb r1, [r0]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A8AC: .4byte gUnknown_08499598
_0807A8B0: .4byte gUnknown_08499578

