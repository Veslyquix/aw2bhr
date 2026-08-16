	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007B54
sub_08007B54: @ 0x08007B54
	push {lr}
	ldr r0, _08007B6C @ =gUnknown_08488890
	movs r1, #0
	bl sub_080152C0
	ldr r1, _08007B70 @ =gUnknown_0200B0B0
	ldr r1, [r1]
	adds r1, #0x6b
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08007B6C: .4byte gUnknown_08488890
_08007B70: .4byte gUnknown_0200B0B0

