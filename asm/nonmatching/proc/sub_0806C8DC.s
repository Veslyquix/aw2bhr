	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C8DC
sub_0806C8DC: @ 0x0806C8DC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r2, #0xb0
	rsbs r2, r2, #0
	ldr r3, [r5, #0x58]
	movs r0, #0x14
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _0806C940 @ =gUnknown_03001FF8
	strh r4, [r0]
	ldr r0, _0806C944 @ =gUnknown_03002B34
	strh r4, [r0]
	ldr r0, _0806C948 @ =gUnknown_030030A0
	strh r4, [r0]
	rsbs r4, r4, #0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0xa0
	bl sub_0806B9CC
	adds r2, r4, #0
	adds r2, #0x40
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0xa0
	bl sub_0806BA6C
	ldr r0, [r5, #0x58]
	cmp r0, #0x13
	ble _0806C950
	movs r0, #0
	str r0, [r5, #0x58]
	bl sub_0806C8A0
	ldr r2, _0806C94C @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r5, #0
	bl Proc_Break
	b _0806C954
	.align 2, 0
_0806C940: .4byte gUnknown_03001FF8
_0806C944: .4byte gUnknown_03002B34
_0806C948: .4byte gUnknown_030030A0
_0806C94C: .4byte gDispIo
_0806C950:
	adds r0, #1
	str r0, [r5, #0x58]
_0806C954:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

