	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028874
sub_08028874: @ 0x08028874
	ldr r2, _0802888C @ =gUnknown_08499598
	ldr r3, [r2]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _08028890 @ =gUnknown_03004080
	ldrh r0, [r0]
	strh r0, [r2, #0x14]
	strb r1, [r2, #0x13]
	bx lr
	.align 2, 0
_0802888C: .4byte gUnknown_08499598
_08028890: .4byte gUnknown_03004080

