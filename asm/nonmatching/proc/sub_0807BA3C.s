	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BA3C
sub_0807BA3C: @ 0x0807BA3C
	push {lr}
	ldr r2, _0807BA5C @ =gUnknown_085C77A0
	ldr r0, _0807BA60 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807BA58
	ldr r0, _0807BA64 @ =0x00000195
	bl sub_0803B524
_0807BA58:
	pop {r0}
	bx r0
	.align 2, 0
_0807BA5C: .4byte gUnknown_085C77A0
_0807BA60: .4byte gUnknown_03003FC0
_0807BA64: .4byte 0x00000195

