	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802AA14
sub_0802AA14: @ 0x0802AA14
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_0802A838
	ldr r1, _0802AA64 @ =0x06013A40
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
	ldr r1, _0802AA68 @ =gUnknown_0849A2A6
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, _0802AA6C @ =gUnknown_0849A284
	adds r4, r4, r0
	ldrb r0, [r1, #2]
	adds r4, r4, r0
	ldr r0, _0802AA70 @ =0x000001FF
	ands r4, r0
	ldrb r0, [r1, #3]
	adds r5, r5, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r5, r0
	ldr r2, _0802AA74 @ =gUnknown_0849A248
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801BD00
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA64: .4byte 0x06013A40
_0802AA68: .4byte gUnknown_0849A2A6
_0802AA6C: .4byte gUnknown_0849A284
_0802AA70: .4byte 0x000001FF
_0802AA74: .4byte gUnknown_0849A248

