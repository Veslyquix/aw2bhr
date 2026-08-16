	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C0E4
sub_0806C0E4: @ 0x0806C0E4
	push {lr}
	adds r2, r0, #0
	ldr r1, _0806C108 @ =gUnknown_0858265C
	ldr r0, [r2, #0x38]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [r2, #0x30]
	ldr r0, [r0, #0x30]
	cmp r1, r0
	blo _0806C10C
	movs r0, #0
	str r0, [r2, #0x30]
	adds r0, r2, #0
	bl Proc_Break
	b _0806C110
	.align 2, 0
_0806C108: .4byte gUnknown_0858265C
_0806C10C:
	adds r0, r1, #1
	str r0, [r2, #0x30]
_0806C110:
	pop {r0}
	bx r0

