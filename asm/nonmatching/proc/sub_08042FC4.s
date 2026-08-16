	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042FC4
sub_08042FC4: @ 0x08042FC4
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08042FEC @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08042FF4
	ldr r2, _08042FF0 @ =gUnknown_085D3DD0
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r0, r4, #6
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08042FF6
	.align 2, 0
_08042FEC: .4byte gUnknown_03003FC0
_08042FF0: .4byte gUnknown_085D3DD0
_08042FF4:
	movs r0, #0
_08042FF6:
	pop {r4}
	pop {r1}
	bx r1

