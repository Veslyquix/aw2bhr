	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B610
sub_0806B610: @ 0x0806B610
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0806B628
	ldr r1, _0806B658 @ =gUnknown_03001418
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0806B628:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r1, _0806B65C @ =0x000003BF
	cmp r0, r1
	ble _0806B64E
	movs r0, #0
	str r0, [sp]
	ldr r0, _0806B660 @ =gUnknown_08499578
	ldr r1, [r0]
	ldr r2, _0806B664 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	bl sub_08013AEC
	adds r0, r4, #0
	bl Proc_Break
_0806B64E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B658: .4byte gUnknown_03001418
_0806B65C: .4byte 0x000003BF
_0806B660: .4byte gUnknown_08499578
_0806B664: .4byte 0x01000200

