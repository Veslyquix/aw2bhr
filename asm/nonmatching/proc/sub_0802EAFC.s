	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802EAFC
sub_0802EAFC: @ 0x0802EAFC
	ldr r0, _0802EB18 @ =gUnknown_03000570
	movs r2, #0
	str r2, [r0]
	ldr r3, _0802EB1C @ =gUnknown_03000564
	ldr r0, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
	ldr r0, _0802EB20 @ =gUnknown_03000568
	str r2, [r0]
	ldr r0, _0802EB24 @ =gUnknown_03000574
	str r2, [r0]
	bx lr
	.align 2, 0
_0802EB18: .4byte gUnknown_03000570
_0802EB1C: .4byte gUnknown_03000564
_0802EB20: .4byte gUnknown_03000568
_0802EB24: .4byte gUnknown_03000574

