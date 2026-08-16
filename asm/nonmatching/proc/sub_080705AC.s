	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080705AC
sub_080705AC: @ 0x080705AC
	push {r4, r5, lr}
	ldr r0, _080705D0 @ =0x0000000B
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080705CA
	ldr r5, _080705D4 @ =gUnknown_08242308
	adds r4, r0, #0
_080705BC:
	ldr r0, [r5]
	bl sub_08070C90
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _080705BC
_080705CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080705D0: .4byte 0x0000000B
_080705D4: .4byte gUnknown_08242308

