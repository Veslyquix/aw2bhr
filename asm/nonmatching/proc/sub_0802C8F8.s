	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C8F8
sub_0802C8F8: @ 0x0802C8F8
	push {r4, lr}
	ldr r0, _0802C93C @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r3, _0802C940 @ =gUnknown_03003100
	ldrh r1, [r3, #2]
	lsls r1, r1, #1
	ldr r4, _0802C944 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	adds r2, #0x12
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802C950
	ldr r2, _0802C948 @ =gUnknown_08499594
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r0, _0802C94C @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_08025FC0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C950
	movs r0, #0
	b _0802C952
	.align 2, 0
_0802C93C: .4byte gUnknown_08499590
_0802C940: .4byte gUnknown_03003100
_0802C944: .4byte 0x0000417A
_0802C948: .4byte gUnknown_08499594
_0802C94C: .4byte gUnknown_030040D8
_0802C950:
	movs r0, #1
_0802C952:
	pop {r4}
	pop {r1}
	bx r1

