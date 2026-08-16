	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FF48
sub_0803FF48: @ 0x0803FF48
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, _0803FF88 @ =gUnknown_030044D4
	str r6, [r0]
	ldr r4, _0803FF8C @ =gUnknown_0849FB04
	ldr r1, _0803FF90 @ =sub_0803FF2C
	adds r0, r4, #0
	bl Proc_ForEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	movs r1, #0
	str r1, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x2c]
	mov r1, sb
	str r1, [r0, #0x30]
	str r6, [r0, #0x54]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF88: .4byte gUnknown_030044D4
_0803FF8C: .4byte gUnknown_0849FB04
_0803FF90: .4byte sub_0803FF2C

