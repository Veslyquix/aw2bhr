	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044968
sub_08044968: @ 0x08044968
	push {lr}
	adds r1, r0, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0804498C
	ldr r2, _08044990 @ =gUnknown_08499594
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_0806AA80
_0804498C:
	pop {r0}
	bx r0
	.align 2, 0
_08044990: .4byte gUnknown_08499594

