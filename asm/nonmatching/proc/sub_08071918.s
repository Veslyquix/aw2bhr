	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071918
sub_08071918: @ 0x08071918
	movs r0, r0
	movs r0, r0
	movs r0, r0
	movs r0, r0
	push {lr}
	ldr r0, _08071944 @ =gUnknown_03002EE0
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08071940
	ldrh r1, [r2, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08071940
	bl sub_0803DDF4
_08071940:
	pop {r0}
	bx r0
	.align 2, 0
_08071944: .4byte gUnknown_03002EE0

