	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B738
sub_0807B738: @ 0x0807B738
	push {lr}
	sub sp, #4
	ldr r2, [r0, #0x30]
	adds r2, #1
	lsls r2, r2, #3
	ldr r3, _0807B758 @ =gUnknown_0848B690
	ldr r0, _0807B75C @ =0x00001064
	str r0, [sp]
	movs r0, #0
	movs r1, #0x71
	bl sub_0801BEBC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807B758: .4byte gUnknown_0848B690
_0807B75C: .4byte 0x00001064

