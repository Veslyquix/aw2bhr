	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DC2C
sub_0802DC2C: @ 0x0802DC2C
	push {lr}
	ldr r0, _0802DC40 @ =gUnknown_03003334
	ldrh r0, [r0]
	cmp r0, #8
	bhi _0802DCA0
	lsls r0, r0, #2
	ldr r1, _0802DC44 @ =_0802DC48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DC40: .4byte gUnknown_03003334
_0802DC44: .4byte _0802DC48
_0802DC48: @ jump table
	.4byte _0802DC6C @ case 0
	.4byte _0802DC72 @ case 1
	.4byte _0802DC78 @ case 2
	.4byte _0802DC7E @ case 3
	.4byte _0802DC84 @ case 4
	.4byte _0802DC8A @ case 5
	.4byte _0802DC90 @ case 6
	.4byte _0802DC96 @ case 7
	.4byte _0802DC9C @ case 8
_0802DC6C:
	bl sub_0802DCB4
	b _0802DCA0
_0802DC72:
	bl sub_0802DE1C
	b _0802DCA0
_0802DC78:
	bl sub_0802DEFC
	b _0802DCA0
_0802DC7E:
	bl sub_0802E698
	b _0802DCA0
_0802DC84:
	bl sub_0802E6C0
	b _0802DCA0
_0802DC8A:
	bl sub_0802E6F8
	b _0802DCA0
_0802DC90:
	bl sub_0802DFC8
	b _0802DCA0
_0802DC96:
	bl sub_0802E260
	b _0802DCA0
_0802DC9C:
	bl sub_0802E278
_0802DCA0:
	pop {r0}
	bx r0

