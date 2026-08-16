	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BB28
sub_0804BB28: @ 0x0804BB28
	push {lr}
	ldr r3, _0804BB40 @ =gUnknown_08555850
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r3, #4
	adds r2, r2, r3
	ldr r0, [r2]
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	.align 2, 0
_0804BB40: .4byte gUnknown_08555850

