	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C074
sub_0806C074: @ 0x0806C074
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806C0B0 @ =gUnknown_0858265C
	ldr r0, [r4, #0x38]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r0, [r4, #0x30]
	movs r1, #0xc
	bl __umodsi3
	cmp r0, #0
	bne _0806C0D6
	ldr r0, [r4, #0x34]
	lsls r1, r0, #3
	adds r1, r5, r1
	ldr r1, [r1]
	adds r2, r0, #0
	cmp r1, #2
	beq _0806C0C0
_0806C09C:
	adds r1, r2, #1
	str r1, [r4, #0x34]
	cmp r1, #5
	ble _0806C0B4
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
	b _0806C0DC
	.align 2, 0
_0806C0B0: .4byte gUnknown_0858265C
_0806C0B4:
	lsls r0, r1, #3
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r1, #0
	cmp r0, #2
	bne _0806C09C
_0806C0C0:
	lsls r1, r2, #3
	adds r0, r5, #4
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r2, #0
	adds r2, r4, #0
	bl sub_0806BED8
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
_0806C0D6:
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
_0806C0DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

