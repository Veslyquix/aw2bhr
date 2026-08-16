	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043FD8
sub_08043FD8: @ 0x08043FD8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r2, _0804401C @ =0xFFFFFE00
	adds r1, r2, #0
	adds r4, r0, #0
	ands r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r2, _08044020 @ =0xFFFFFF00
	adds r1, r2, #0
	adds r3, r7, #0
	ands r3, r1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r1, _08044024 @ =0x000001FF
	ands r1, r0
	adds r2, r7, #0
	subs r2, #0x30
	movs r0, #0xff
	ands r2, r0
	orrs r1, r4
	orrs r2, r3
	ldr r3, _08044028 @ =gUnknown_084A0790
	str r5, [sp]
	adds r0, r6, #0
	bl sub_0801BEFC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804401C: .4byte 0xFFFFFE00
_08044020: .4byte 0xFFFFFF00
_08044024: .4byte 0x000001FF
_08044028: .4byte gUnknown_084A0790

