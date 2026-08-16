	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080603D4
sub_080603D4: @ 0x080603D4
	push {lr}
	ldr r2, _08060410 @ =gUnknown_030033E4
	ldr r1, _08060414 @ =gUnknown_030046C0
	ldrb r0, [r1, #6]
	strh r0, [r2]
	ldrb r0, [r1, #7]
	strh r0, [r2, #2]
	movs r0, #2
	bl sub_08023274
	ldr r1, _08060418 @ =gUnknown_030046D4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, [r1]
	cmp r0, #0x1e
	bgt _08060404
	ldr r0, _0806041C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806040A
_08060404:
	ldr r1, _08060420 @ =gUnknown_030045D4
	movs r0, #5
	strh r0, [r1]
_0806040A:
	pop {r0}
	bx r0
	.align 2, 0
_08060410: .4byte gUnknown_030033E4
_08060414: .4byte gUnknown_030046C0
_08060418: .4byte gUnknown_030046D4
_0806041C: .4byte gpKeySt
_08060420: .4byte gUnknown_030045D4

