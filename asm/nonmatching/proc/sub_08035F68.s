	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035F68
sub_08035F68: @ 0x08035F68
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08035F94 @ =gUnknown_0849CD88
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #0x1e]
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _08035F9C
	ldr r0, _08035F98 @ =gUnknown_0849BDE8
	bl sub_0801537C
	adds r0, r4, #0
	bl sub_08035E90
	b _08035FA2
	.align 2, 0
_08035F94: .4byte gUnknown_0849CD88
_08035F98: .4byte gUnknown_0849BDE8
_08035F9C:
	adds r0, r4, #0
	bl sub_08035E90
_08035FA2:
	pop {r4}
	pop {r0}
	bx r0

