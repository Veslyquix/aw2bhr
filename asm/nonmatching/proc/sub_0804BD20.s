	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BD20
sub_0804BD20: @ 0x0804BD20
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	lsls r4, r4, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804BD54 @ =gUnknown_08555D30
	lsrs r4, r4, #0xe
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r4, r4, r3
	ldr r0, [r4]
	adds r1, r2, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r0, [r4]
	adds r1, r5, #0
	bl sub_0804BD58
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD54: .4byte gUnknown_08555D30

