	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077C70
sub_08077C70: @ 0x08077C70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08077CA4 @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	ldr r0, _08077CA8 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _08077C9C
	movs r0, #0
	str r0, [r4, #0x44]
	movs r0, #0x66
	bl sub_0803B4DC
	adds r0, r4, #0
	bl Proc_Break
_08077C9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077CA4: .4byte gUnknown_0300064C
_08077CA8: .4byte gUnknown_03002EE0

