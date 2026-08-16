	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080705E4
sub_080705E4: @ 0x080705E4
	push {r4, r5, lr}
	ldr r0, _08070608 @ =0x0000000B
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08070602
	ldr r5, _0807060C @ =gUnknown_08242308
	adds r4, r0, #0
_080705F4:
	ldr r0, [r5]
	bl sub_080703B8
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bne _080705F4
_08070602:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070608: .4byte 0x0000000B
_0807060C: .4byte gUnknown_08242308

