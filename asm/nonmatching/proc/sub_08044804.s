	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044804
sub_08044804: @ 0x08044804
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08044834 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldr r1, _08044838 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsrs r1, r1, #1
	bl sub_08025B58
	movs r0, #0xfb
	lsls r0, r0, #1
	bl sub_0803B4DC
	adds r0, r4, #0
	bl sub_080443C4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044834: .4byte gUnknown_030033EC
_08044838: .4byte gUnknown_08499598

