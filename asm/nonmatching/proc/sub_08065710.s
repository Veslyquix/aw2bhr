	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065710
sub_08065710: @ 0x08065710
	push {lr}
	sub sp, #4
	movs r0, #1
	str r0, [sp]
	movs r0, #0x68
	movs r1, #0xac
	movs r2, #4
	movs r3, #0
	bl sub_0801F34C
	ldr r0, _08065744 @ =gUnknown_08580DD8
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0806573E
	ldr r0, _08065748 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0806573E:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08065744: .4byte gUnknown_08580DD8
_08065748: .4byte gUnknown_03001FBC

