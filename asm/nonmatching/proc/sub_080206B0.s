	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080206B0
sub_080206B0: @ 0x080206B0
	push {r4, lr}
	adds r2, r0, #0
	movs r1, #0
	ldr r3, _080206E0 @ =gUnknown_085C77A0
	ldr r0, [r3, #0x2c]
	cmp r0, r2
	beq _080206D8
	movs r4, #0x5c
	adds r3, #0x2c
_080206C2:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xbf
	bhi _080206D8
	adds r0, r1, #0
	muls r0, r4, r0
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, r2
	bne _080206C2
_080206D8:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080206E0: .4byte gUnknown_085C77A0

