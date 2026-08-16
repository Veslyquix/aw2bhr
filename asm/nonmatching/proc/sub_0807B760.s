	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B760
sub_0807B760: @ 0x0807B760
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807B788 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807B780
	ldr r0, _0807B78C @ =gUnknown_0861604C
	adds r1, r4, #0
	bl Proc_Start
	adds r0, r4, #0
	bl Proc_Break
_0807B780:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B788: .4byte gpKeySt
_0807B78C: .4byte gUnknown_0861604C

