	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025E74
sub_08025E74: @ 0x08025E74
	push {r4, lr}
	ldr r4, _08025E98 @ =gUnknown_08499594
	movs r3, #0
	movs r2, #0
	movs r1, #0xff
_08025E7E:
	ldr r0, [r4]
	adds r0, r2, r0
	strb r3, [r0]
	adds r2, #0xc
	subs r1, #1
	cmp r1, #0
	bge _08025E7E
	movs r1, #0
	ldr r0, _08025E9C @ =gUnknown_030032C0
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025E98: .4byte gUnknown_08499594
_08025E9C: .4byte gUnknown_030032C0

