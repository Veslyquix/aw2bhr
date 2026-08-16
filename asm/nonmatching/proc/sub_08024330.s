	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024330
sub_08024330: @ 0x08024330
	push {lr}
	ldr r0, _08024348 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x28
	bl __umodsi3
	cmp r0, #0
	beq _0802434C
	cmp r0, #4
	beq _08024360
	b _0802436A
	.align 2, 0
_08024348: .4byte gUnknown_03004008
_0802434C:
	ldr r0, _08024358 @ =gUnknown_0810E6E0
	ldr r1, _0802435C @ =0x050001C0
	movs r2, #0x20
	bl sub_08011C68
	b _0802436A
	.align 2, 0
_08024358: .4byte gUnknown_0810E6E0
_0802435C: .4byte 0x050001C0
_08024360:
	ldr r0, _08024370 @ =gUnknown_0810E720
	ldr r1, _08024374 @ =0x050001C0
	movs r2, #0x20
	bl sub_08011C68
_0802436A:
	pop {r0}
	bx r0
	.align 2, 0
_08024370: .4byte gUnknown_0810E720
_08024374: .4byte 0x050001C0

