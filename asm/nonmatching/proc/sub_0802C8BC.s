	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C8BC
sub_0802C8BC: @ 0x0802C8BC
	push {r4, lr}
	ldr r0, _0802C8E4 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r3, _0802C8E8 @ =gUnknown_03003100
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r4, _0802C8EC @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0802C8F0
	movs r0, #1
	b _0802C8F2
	.align 2, 0
_0802C8E4: .4byte gUnknown_08499590
_0802C8E8: .4byte gUnknown_03003100
_0802C8EC: .4byte 0x0000417A
_0802C8F0:
	movs r0, #0
_0802C8F2:
	pop {r4}
	pop {r1}
	bx r1

