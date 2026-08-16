	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AE50
sub_0804AE50: @ 0x0804AE50
	push {lr}
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804AE6C
	ldr r0, _0804AE70 @ =gUnknown_084C3D7C
	movs r1, #0
	bl sub_080152C0
	ldr r0, _0804AE74 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0804AE6C:
	pop {r0}
	bx r0
	.align 2, 0
_0804AE70: .4byte gUnknown_084C3D7C
_0804AE74: .4byte gUnknown_03001FBC

