	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CF54
sub_0803CF54: @ 0x0803CF54
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, _0803CF94 @ =gUnknown_02000000
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_0803CFA4
	ldr r0, _0803CF98 @ =gUnknown_030040A0
	ldr r0, [r0]
	cmp r0, #0
	bne _0803CF7A
	bl sub_080248F8
	ldr r2, _0803CF9C @ =0x000004C3
	adds r1, r4, r2
	strb r0, [r1]
_0803CF7A:
	adds r0, r5, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0803CFA0 @ =0x00000724
	adds r1, r4, #0
	bl sub_0801A7D8
	bl sub_0803D48C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CF94: .4byte gUnknown_02000000
_0803CF98: .4byte gUnknown_030040A0
_0803CF9C: .4byte 0x000004C3
_0803CFA0: .4byte 0x00000724

