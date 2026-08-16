	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078E48
sub_08078E48: @ 0x08078E48
	push {lr}
	bl sub_0807898C
	bl sub_08078AF0
	ldr r2, _08078E88 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	bl sub_08013B0C
	bl sub_0807A908
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0801A5B0
	ldr r2, _08078E8C @ =gUnknown_085C77A0
	ldr r0, _08078E90 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x16]
	movs r1, #0
	bl sub_0807A99C
	pop {r0}
	bx r0
	.align 2, 0
_08078E88: .4byte gDispIo
_08078E8C: .4byte gUnknown_085C77A0
_08078E90: .4byte gUnknown_03003FC0

