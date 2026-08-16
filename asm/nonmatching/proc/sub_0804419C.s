	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804419C
sub_0804419C: @ 0x0804419C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08044374
	cmp r0, #9
	ble _080441AC
	movs r1, #0xc8
	b _080441C0
_080441AC:
	adds r0, r4, #0
	bl sub_08044374
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0x12
	movs r0, #0xc8
	lsls r0, r0, #0xf
	adds r1, r1, r0
	lsrs r1, r1, #0x10
_080441C0:
	ldr r0, _080441D0 @ =0x00002328
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080441D0: .4byte 0x00002328

