	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C450
sub_0802C450: @ 0x0802C450
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802C470 @ =gUnknown_03001FFC
	ldrh r1, [r2, #0x1e]
	strh r1, [r0]
	lsls r0, r1, #0x10
	cmp r0, #0
	bne _0802C478
	bl sub_08012358
	ldr r0, _0802C474 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _0802C47C
	.align 2, 0
_0802C470: .4byte gUnknown_03001FFC
_0802C474: .4byte gUnknown_03001FBC
_0802C478:
	subs r0, r1, #1
	strh r0, [r2, #0x1e]
_0802C47C:
	pop {r0}
	bx r0

