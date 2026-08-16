	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042EDC
sub_08042EDC: @ 0x08042EDC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08042F04 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08042F0C
	ldr r2, _08042F08 @ =gUnknown_085D3DD0
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r0, r4, #6
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x64
	b _08042F0E
	.align 2, 0
_08042F04: .4byte gUnknown_03003FC0
_08042F08: .4byte gUnknown_085D3DD0
_08042F0C:
	movs r0, #0x64
_08042F0E:
	pop {r4}
	pop {r1}
	bx r1

