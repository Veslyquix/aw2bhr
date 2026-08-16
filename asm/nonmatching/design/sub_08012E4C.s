	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012E4C
sub_08012E4C: @ 0x08012E4C
	ldr r0, _08012E60 @ =gUnknown_03004008
	ldr r1, [r0]
	movs r0, #0x1f
	ands r1, r0
	adds r0, r1, #0
	cmp r1, #0xb
	bhi _08012E64
	movs r0, #0
	b _08012E72
	.align 2, 0
_08012E60: .4byte gUnknown_03004008
_08012E64:
	cmp r1, #0xf
	bls _08012E6C
	cmp r0, #0x1b
	bls _08012E70
_08012E6C:
	movs r0, #1
	b _08012E72
_08012E70:
	movs r0, #2
_08012E72:
	bx lr

