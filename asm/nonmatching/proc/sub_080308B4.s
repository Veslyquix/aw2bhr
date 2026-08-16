	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080308B4
sub_080308B4: @ 0x080308B4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08030928 @ =gUnknown_08090CD8
	ldr r3, [r4]
	ldr r2, [r3]
	ldr r1, _0803092C @ =0x00001AAD
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r2, r0
	movs r0, #0xaf
	strb r0, [r2]
	ldr r0, [r3]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r3]
	ldrh r0, [r1, #0x20]
	strh r0, [r2, #2]
	movs r0, #0x14
	strh r0, [r2, #4]
	ldrh r0, [r1, #0x20]
	adds r0, #1
	ldrh r3, [r1, #0x20]
	strh r0, [r1, #0x20]
	movs r3, #0
	adds r2, #6
_080308F2:
	adds r1, r2, r3
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x13
	bls _080308F2
	ldr r3, [r4]
	ldr r1, [r3]
	ldr r2, _0803092C @ =0x00001AAD
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	ldrb r4, [r1]
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030928: .4byte gUnknown_08090CD8
_0803092C: .4byte 0x00001AAD

