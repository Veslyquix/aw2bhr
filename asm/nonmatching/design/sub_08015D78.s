	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015D78
sub_08015D78: @ 0x08015D78
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08015D9C @ =gUnknown_03001470
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r3, r2, #0
	adds r3, #8
	adds r3, r1, r3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r2, [r0]
	str r2, [r3]
	adds r0, #8
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_08015D9C: .4byte gUnknown_03001470

