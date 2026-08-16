	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BA68
sub_0807BA68: @ 0x0807BA68
	push {lr}
	adds r2, r0, #0
	ldr r0, _0807BA88 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807BA82
	ldr r0, _0807BA8C @ =gUnknown_08616570
	adds r1, r2, #0
	bl Proc_Start
_0807BA82:
	pop {r0}
	bx r0
	.align 2, 0
_0807BA88: .4byte gUnknown_03002EE0
_0807BA8C: .4byte gUnknown_08616570

