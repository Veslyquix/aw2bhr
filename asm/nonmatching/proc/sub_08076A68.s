	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076A68
sub_08076A68: @ 0x08076A68
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r6, _08076ACC @ =gUnknown_0202FDFC
	movs r1, #0
	strh r7, [r6]
	strh r7, [r6, #2]
	strh r7, [r6, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0xc]
	strb r1, [r6, #0x10]
	movs r0, #0x37
	strh r0, [r6, #4]
	movs r0, #0x50
	strh r0, [r6, #6]
	ldr r0, _08076AD0 @ =gUnknown_081D0BAC
	ldr r4, _08076AD4 @ =gUnknown_08614280
	ldr r1, [r4]
	bl Decompress
	ldr r0, [r4]
	ldr r1, _08076AD8 @ =0x0600F000
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_08011E54
	adds r0, r5, #0
	bl sub_08076888
	bl sub_0803866C
	cmp r0, #0
	beq _08076AAE
	movs r7, #0x22
_08076AAE:
	adds r4, r7, #0
	adds r0, r4, #0
	bl sub_08074754
	adds r0, r6, #0
	adds r0, #0x12
	adds r4, r4, r0
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076ACC: .4byte gUnknown_0202FDFC
_08076AD0: .4byte gUnknown_081D0BAC
_08076AD4: .4byte gUnknown_08614280
_08076AD8: .4byte 0x0600F000

