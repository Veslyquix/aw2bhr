	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08056E9C
sub_08056E9C: @ 0x08056E9C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08056EE8 @ =gUnknown_02029A10
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	movs r1, #0xb4
	muls r0, r1, r0
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r0, [r2, #0x14]
	ldrh r1, [r2, #0x16]
	cmp r0, r1
	beq _08056EE4
	adds r0, #1
	strh r0, [r2, #0x14]
	ldrh r0, [r2, #0x10]
	ldrh r1, [r2, #0xc]
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r2, #0x12]
	ldrh r1, [r2, #0xe]
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #0xa]
	adds r0, r0, r1
	strh r0, [r2, #0xa]
_08056EE4:
	bx lr
	.align 2, 0
_08056EE8: .4byte gUnknown_02029A10

