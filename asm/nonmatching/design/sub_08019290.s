	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019290
sub_08019290: @ 0x08019290
	adds r2, r0, #0
	movs r1, #0
	ldr r3, _080192AC @ =gUnknown_0200C528
_08019296:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, r2
	bne _080192B0
	adds r0, r1, #0
	b _080192C0
	.align 2, 0
_080192AC: .4byte gUnknown_0200C528
_080192B0:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _08019296
	movs r0, #1
	rsbs r0, r0, #0
_080192C0:
	bx lr
	.align 2, 0

