	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BA1C
sub_0803BA1C: @ 0x0803BA1C
	push {r4, lr}
	bl sub_080745C0
	ldr r0, _0803BA44 @ =gUnknown_0200C420
	ldr r1, [r0, #0x38]
	ldr r2, _0803BA48 @ =0xFFF000FF
	ands r1, r2
	str r1, [r0, #0x38]
	movs r4, #0x60
_0803BA2E:
	adds r0, r4, #0
	movs r1, #0
	bl sub_0803CBA0
	adds r4, #1
	cmp r4, #0x9f
	ble _0803BA2E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BA44: .4byte gUnknown_0200C420
_0803BA48: .4byte 0xFFF000FF

