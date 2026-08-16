	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066FE0
sub_08066FE0: @ 0x08066FE0
	push {lr}
	bl sub_08066EBC
	ldr r0, _0806700C @ =gUnknown_08580934
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806701C
	ldr r0, _08067010 @ =gUnknown_0202F200
	ldrb r0, [r0]
	cmp r0, #1
	beq _0806701C
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bne _08067014
	bl sub_08066B6C
	b _08067018
	.align 2, 0
_0806700C: .4byte gUnknown_08580934
_08067010: .4byte gUnknown_0202F200
_08067014:
	bl sub_08066D74
_08067018:
	bl sub_08066F20
_0806701C:
	pop {r0}
	bx r0

