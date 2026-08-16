	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A79C
sub_0801A79C: @ 0x0801A79C
	push {r4, r5, lr}
	ldr r5, [sp, #0xc]
	ldr r4, _0801A7C4 @ =gUnknown_0200CC24
	str r0, [r4]
	ldr r0, _0801A7C8 @ =gUnknown_0200CC28
	str r1, [r0]
	ldr r0, _0801A7CC @ =gUnknown_0200CC2C
	str r2, [r0]
	ldr r0, _0801A7D0 @ =gUnknown_0200CC30
	strb r3, [r0]
	ldr r0, _0801A7D4 @ =gUnknown_0200CC34
	str r5, [r0]
	bl sub_0801AFF4
	movs r0, #0
	bl sub_0801B2FC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A7C4: .4byte gUnknown_0200CC24
_0801A7C8: .4byte gUnknown_0200CC28
_0801A7CC: .4byte gUnknown_0200CC2C
_0801A7D0: .4byte gUnknown_0200CC30
_0801A7D4: .4byte gUnknown_0200CC34

