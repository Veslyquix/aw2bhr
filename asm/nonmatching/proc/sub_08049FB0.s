	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049FB0
sub_08049FB0: @ 0x08049FB0
	push {lr}
	bl sub_08022A34
	ldr r0, _08049FD0 @ =gUnknown_02028E40
	ldrb r1, [r0]
	lsls r1, r1, #0x14
	movs r0, #0x90
	lsls r0, r0, #0xd
	adds r1, r1, r0
	asrs r1, r1, #0x10
	movs r0, #0x60
	bl sub_08022AD0
	pop {r0}
	bx r0
	.align 2, 0
_08049FD0: .4byte gUnknown_02028E40

