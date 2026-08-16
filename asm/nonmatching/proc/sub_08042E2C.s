	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042E2C
sub_08042E2C: @ 0x08042E2C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08042E54 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08042E5C
	ldr r2, _08042E58 @ =gUnknown_085D3DD0
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r0, r4, #6
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08042E5E
	.align 2, 0
_08042E54: .4byte gUnknown_03003FC0
_08042E58: .4byte gUnknown_085D3DD0
_08042E5C:
	movs r0, #0xa
_08042E5E:
	pop {r4}
	pop {r1}
	bx r1

