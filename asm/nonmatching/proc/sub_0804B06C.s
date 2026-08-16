	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B06C
sub_0804B06C: @ 0x0804B06C
	push {lr}
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B080
	ldr r0, _0804B084 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0804B080:
	pop {r0}
	bx r0
	.align 2, 0
_0804B084: .4byte gUnknown_03001FBC

