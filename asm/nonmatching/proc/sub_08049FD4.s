	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049FD4
sub_08049FD4: @ 0x08049FD4
	push {lr}
	ldr r0, _08049FF0 @ =gUnknown_02028E40
	ldrb r1, [r0]
	lsls r1, r1, #0x14
	movs r0, #0x90
	lsls r0, r0, #0xd
	adds r1, r1, r0
	asrs r1, r1, #0x10
	movs r0, #0x60
	movs r2, #3
	bl sub_0802323C
	pop {r0}
	bx r0
	.align 2, 0
_08049FF0: .4byte gUnknown_02028E40

