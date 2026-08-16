	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F234
sub_0801F234: @ 0x0801F234
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_0801F3D4
	adds r1, r0, #0
	ldr r2, _0801F2A0 @ =gUnknown_0200F920
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrb r0, [r4, #5]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldrh r7, [r0, #8]
	ldr r2, _0801F2A4 @ =gUnknown_0848B780
	lsls r0, r5, #2
	adds r0, r0, r2
	ldrb r2, [r0]
	ldrb r0, [r0, #1]
	adds r6, r2, #0
	muls r6, r0, r6
	adds r0, r5, #0
	bl sub_0801F444
	adds r3, r0, #0
	ldr r2, _0801F2A8 @ =0x000003FF
	adds r0, r7, #0
	ands r0, r2
	lsls r0, r0, #5
	ldr r1, [r4]
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #5
	lsrs r2, r0, #2
	adds r0, r3, #0
	bl CpuFastSet
	ldrb r0, [r4, #5]
	lsls r0, r0, #2
	adds r0, r4, r0
	strh r5, [r0, #0xa]
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r7, r6
	strh r1, [r0, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F2A0: .4byte gUnknown_0200F920
_0801F2A4: .4byte gUnknown_0848B780
_0801F2A8: .4byte 0x000003FF

