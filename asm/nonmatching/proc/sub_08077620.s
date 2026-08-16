	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077620
sub_08077620: @ 0x08077620
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	lsls r0, r5, #1
	adds r6, r0, #0
	subs r6, #0x60
	cmp r7, #0xef
	bgt _08077650
	ldr r3, _08077680 @ =gUnknown_081CC5D0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x80
	bl PutSprite
	ldr r3, _08077684 @ =gUnknown_081CC5DE
	str r4, [sp]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x78
	bl PutSprite
_08077650:
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0xae
	bhi _08077678
	adds r0, r7, #0
	adds r0, #0x18
	adds r1, r5, #0
	adds r1, #0x10
	ldr r2, _08077688 @ =0x00002098
	movs r3, #0
	bl sub_0804402C
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _0807768C @ =gUnknown_081CC5B0
	movs r0, #0
	str r0, [sp]
	movs r1, #0x50
	bl PutSprite
_08077678:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077680: .4byte gUnknown_081CC5D0
_08077684: .4byte gUnknown_081CC5DE
_08077688: .4byte 0x00002098
_0807768C: .4byte gUnknown_081CC5B0

