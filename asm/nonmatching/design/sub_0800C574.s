	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C574
sub_0800C574: @ 0x0800C574
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r0, _0800C5F0 @ =gUnknown_0200B0B0
	mov ip, r0
	ldr r1, [r0]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0x5b
	bgt _0800C5E8
	adds r3, r0, #0
	ldr r0, _0800C5F4 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r4, _0800C5F8 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0800C5FC @ =0x0000193A
	adds r1, r1, r2
	adds r1, r1, r0
	movs r4, #0
	strb r3, [r1]
	ldr r2, _0800C600 @ =gUnknown_084995A0
	ldr r0, [r2]
	lsls r1, r3, #3
	adds r0, r1, r0
	strb r7, [r0]
	ldr r0, [r2]
	adds r0, r1, r0
	strb r5, [r0, #1]
	ldr r0, [r2]
	adds r0, r1, r0
	strb r6, [r0, #2]
	ldr r0, [r2]
	adds r0, r1, r0
	strb r4, [r0, #3]
	ldr r0, [r2]
	adds r1, r1, r0
	movs r0, #0xff
	strb r0, [r1, #8]
	ldr r1, _0800C604 @ =gUnknown_03003150
	lsls r0, r3, #2
	adds r0, r0, r1
	strb r7, [r0]
	strb r5, [r0, #1]
	strb r6, [r0, #2]
	adds r3, #1
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	mov r4, ip
	ldr r0, [r4]
	strb r3, [r0, #0x12]
_0800C5E8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C5F0: .4byte gUnknown_0200B0B0
_0800C5F4: .4byte gUnknown_08499590
_0800C5F8: .4byte 0x0000417A
_0800C5FC: .4byte 0x0000193A
_0800C600: .4byte gUnknown_084995A0
_0800C604: .4byte gUnknown_03003150

