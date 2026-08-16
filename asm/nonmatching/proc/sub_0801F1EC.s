	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F1EC
sub_0801F1EC: @ 0x0801F1EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_0801F3D4
	ldr r2, _0801F220 @ =gUnknown_0200F920
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r3, #0
	ldrb r0, [r1, #5]
	cmp r3, r0
	bge _0801F22E
	adds r2, r1, #0
	adds r2, #8
_0801F20C:
	ldrh r0, [r2, #2]
	cmp r0, r4
	bne _0801F224
	ldr r1, [r1]
	ldrh r2, [r2]
	adds r0, r5, #0
	bl sub_0801F19C
	b _0801F22E
	.align 2, 0
_0801F220: .4byte gUnknown_0200F920
_0801F224:
	adds r2, #4
	adds r3, #1
	ldrb r0, [r1, #5]
	cmp r3, r0
	blt _0801F20C
_0801F22E:
	pop {r4, r5}
	pop {r0}
	bx r0

