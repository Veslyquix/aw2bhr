	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025378
sub_08025378: @ 0x08025378
	push {lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, _080253A8 @ =gUnknown_08499594
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r2, [r1, #1]
	movs r0, #0xfd
	ands r0, r2
	strb r0, [r1, #1]
	ldr r0, _080253AC @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080253A2
	adds r0, r3, #0
	movs r1, #1
	bl sub_080211DC
_080253A2:
	pop {r0}
	bx r0
	.align 2, 0
_080253A8: .4byte gUnknown_08499594
_080253AC: .4byte gUnknown_03003FC0

