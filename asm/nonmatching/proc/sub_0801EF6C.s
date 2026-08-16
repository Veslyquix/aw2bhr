	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EF6C
sub_0801EF6C: @ 0x0801EF6C
	push {lr}
	movs r0, #0
	movs r1, #0x80
	bl sub_0801E0C8
	ldr r1, _0801EF88 @ =gUnknown_03002B54
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _0801EF8C @ =gUnknown_03001FE4
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801EF88: .4byte gUnknown_03002B54
_0801EF8C: .4byte gUnknown_03001FE4

