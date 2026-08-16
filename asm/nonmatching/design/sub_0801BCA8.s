	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BCA8
sub_0801BCA8: @ 0x0801BCA8
	push {r4, lr}
	ldr r4, _0801BCCC @ =gUnknown_03000268
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl sub_080718E8
	ldr r1, _0801BCD0 @ =gUnknown_03002F2C
	ldr r0, [r4]
	str r0, [r1]
	ldr r1, _0801BCD4 @ =gUnknown_030030D4
	ldr r0, _0801BCD8 @ =gUnknown_03002520
	str r0, [r1]
	ldr r1, _0801BCDC @ =gUnknown_030024C0
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BCCC: .4byte gUnknown_03000268
_0801BCD0: .4byte gUnknown_03002F2C
_0801BCD4: .4byte gUnknown_030030D4
_0801BCD8: .4byte gUnknown_03002520
_0801BCDC: .4byte gUnknown_030024C0

