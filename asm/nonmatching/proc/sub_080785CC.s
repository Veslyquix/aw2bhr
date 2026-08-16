	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080785CC
sub_080785CC: @ 0x080785CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x14]
	ldr r0, _080785F8 @ =gUnknown_08615ACC
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	mov r1, r8
	str r1, [r0, #0x54]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080785F8: .4byte gUnknown_08615ACC

