	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043B60
sub_08043B60: @ 0x08043B60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r1, _08043B98 @ =0xFFFFFE00
	adds r2, r1, #0
	adds r1, r0, #0
	ands r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08043B9C @ =0xFFFFFF00
	adds r3, r2, #0
	adds r2, r4, #0
	ands r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	orrs r1, r0
	orrs r2, r4
	ldr r3, _08043BA0 @ =gUnknown_084A0730
	str r5, [sp]
	adds r0, r6, #0
	bl sub_0801BEFC
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043B98: .4byte 0xFFFFFE00
_08043B9C: .4byte 0xFFFFFF00
_08043BA0: .4byte gUnknown_084A0730

