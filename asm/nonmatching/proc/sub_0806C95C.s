	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C95C
sub_0806C95C: @ 0x0806C95C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0xb0
	rsbs r1, r1, #0
	ldr r3, [r4, #0x58]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	ldr r1, _0806C99C @ =gUnknown_03001FF8
	strh r0, [r1]
	ldr r1, _0806C9A0 @ =gUnknown_03002B34
	strh r0, [r1]
	ldr r1, _0806C9A4 @ =gUnknown_030030A0
	strh r0, [r1]
	rsbs r0, r0, #0
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0
	movs r3, #0xa0
	bl sub_0806BA6C
	ldr r0, [r4, #0x58]
	cmp r0, #0xf
	ble _0806C9A8
	adds r0, r4, #0
	bl Proc_Break
	b _0806C9AC
	.align 2, 0
_0806C99C: .4byte gUnknown_03001FF8
_0806C9A0: .4byte gUnknown_03002B34
_0806C9A4: .4byte gUnknown_030030A0
_0806C9A8:
	adds r0, #1
	str r0, [r4, #0x58]
_0806C9AC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

