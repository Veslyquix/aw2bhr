	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806502C
sub_0806502C: @ 0x0806502C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806504C @ =gUnknown_08580A38
	movs r1, #3
	bl sub_080152EC
	movs r2, #0x28
	ldrsh r1, [r4, r2]
	adds r1, #8
	ldrh r2, [r4, #0x1c]
	lsls r3, r2, #1
	bl sub_08064BC8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806504C: .4byte gUnknown_08580A38

