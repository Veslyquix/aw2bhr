	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063BBC
sub_08063BBC: @ 0x08063BBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063BDC @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_08063BE0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063BDC: .4byte gUnknown_03001FBC

