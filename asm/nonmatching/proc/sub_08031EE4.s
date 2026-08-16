	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031EE4
sub_08031EE4: @ 0x08031EE4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080718F0
	bl sub_080135A4
	ldrh r0, [r4, #0x1e]
	subs r0, #1
	strh r0, [r4, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08031F04
	ldr r0, _08031F0C @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08031F04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031F0C: .4byte gUnknown_03001FBC

