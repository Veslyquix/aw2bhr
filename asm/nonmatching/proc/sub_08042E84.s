	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042E84
sub_08042E84: @ 0x08042E84
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08042EAC @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08042EB4
	ldr r2, _08042EB0 @ =gUnknown_085D3DD0
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r0, r4, #6
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08042EB6
	.align 2, 0
_08042EAC: .4byte gUnknown_03003FC0
_08042EB0: .4byte gUnknown_085D3DD0
_08042EB4:
	movs r0, #0
_08042EB6:
	pop {r4}
	pop {r1}
	bx r1

