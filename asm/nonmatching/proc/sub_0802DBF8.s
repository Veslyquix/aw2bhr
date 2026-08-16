	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DBF8
sub_0802DBF8: @ 0x0802DBF8
	ldr r0, _0802DC18 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r1, [r0, #0x10]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0802DC24
	ldr r0, _0802DC1C @ =gUnknown_030033E0
	ldr r0, [r0]
	ldr r1, _0802DC20 @ =0x000F000F
	ands r0, r1
	cmp r0, #0
	bne _0802DC24
	movs r0, #1
	b _0802DC26
	.align 2, 0
_0802DC18: .4byte gUnknown_08499590
_0802DC1C: .4byte gUnknown_030033E0
_0802DC20: .4byte 0x000F000F
_0802DC24:
	movs r0, #0
_0802DC26:
	bx lr

