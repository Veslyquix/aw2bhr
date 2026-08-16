	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B6BC
sub_0801B6BC: @ 0x0801B6BC
	push {lr}
	ldr r3, _0801B6E0 @ =gUnknown_086173F0
	ldr r1, _0801B6E4 @ =gUnknown_03005C88
	ldr r0, _0801B6E8 @ =gUnknown_0300677C
	subs r0, r0, r1
	cmp r0, #0
	bge _0801B6CC
	adds r0, #3
_0801B6CC:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r2, r0
	adds r0, r3, #0
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_0801B6E0: .4byte gUnknown_086173F0
_0801B6E4: .4byte gUnknown_03005C88
_0801B6E8: .4byte gUnknown_0300677C

