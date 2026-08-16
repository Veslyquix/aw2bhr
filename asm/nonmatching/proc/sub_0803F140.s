	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F140
sub_0803F140: @ 0x0803F140
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	add r1, sp, #0xc
	adds r5, r6, #0
	adds r5, #0x6a
	movs r0, #0
	ldrsh r2, [r5, r0]
	add r0, sp, #8
	bl sub_0803F29C
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_0803F110
	ldr r1, _0803F1C8 @ =0x06013940
	bl sub_08011CAC
	ldr r0, _0803F1CC @ =gUnknown_08109564
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_08013618
	movs r7, #0
	ldrsh r0, [r5, r7]
	bl sub_0803F128
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x68
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0803F27C
	ldr r1, [r6, #0x54]
	lsls r1, r1, #4
	ldr r2, _0803F1D0 @ =gUnknown_08499590
	ldr r3, [r2]
	movs r7, #4
	ldrsh r2, [r3, r7]
	subs r1, r1, r2
	ldr r2, [sp, #8]
	adds r1, r1, r2
	ldr r2, [r6, #0x58]
	lsls r2, r2, #4
	movs r6, #6
	ldrsh r3, [r3, r6]
	subs r2, r2, r3
	ldr r3, [sp, #0xc]
	adds r2, r2, r3
	ldr r3, _0803F1D4 @ =0x000031CA
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl sub_0801C70C
	movs r0, #0xe2
	lsls r0, r0, #1
	bl sub_0803B4DC
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F1C8: .4byte 0x06013940
_0803F1CC: .4byte gUnknown_08109564
_0803F1D0: .4byte gUnknown_08499590
_0803F1D4: .4byte 0x000031CA

