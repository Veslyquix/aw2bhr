	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080360A4
sub_080360A4: @ 0x080360A4
	push {lr}
	adds r3, r0, #0
	ldr r2, _080360CC @ =gUnknown_0849CD88
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x1e]
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _080360C6
	adds r0, r3, #0
	bl sub_08035E90
_080360C6:
	pop {r0}
	bx r0
	.align 2, 0
_080360CC: .4byte gUnknown_0849CD88

