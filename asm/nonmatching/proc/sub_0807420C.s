	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807420C
sub_0807420C: @ 0x0807420C
	push {lr}
	ldr r0, _08074224 @ =gUnknown_0812B29C
	ldr r1, _08074228 @ =0x06001F00
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011C68
	ldr r0, _0807422C @ =sub_08037F1C
	bl sub_08011B34
	pop {r0}
	bx r0
	.align 2, 0
_08074224: .4byte gUnknown_0812B29C
_08074228: .4byte 0x06001F00
_0807422C: .4byte sub_08037F1C

