	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025308
sub_08025308: @ 0x08025308
	push {r4, lr}
	movs r4, #0
	movs r3, #1
	ldr r1, _08025338 @ =gUnknown_08499594
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #8
	adds r2, r2, r1
	ldr r0, _0802533C @ =0xFFFFFD0C
	adds r2, r2, r0
_0802531E:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08025326
	adds r4, #1
_08025326:
	adds r2, #0xc
	adds r3, #1
	cmp r3, #0x32
	ble _0802531E
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08025338: .4byte gUnknown_08499594
_0802533C: .4byte 0xFFFFFD0C

