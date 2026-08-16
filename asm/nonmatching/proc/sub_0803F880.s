	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F880
sub_0803F880: @ 0x0803F880
	push {r4, r5, r6, r7, lr}
	cmp r0, #0
	beq _0803F890
	ldr r7, _0803F88C @ =gUnknown_080D3DE4
	b _0803F892
	.align 2, 0
_0803F88C: .4byte gUnknown_080D3DE4
_0803F890:
	ldr r7, _0803F8A4 @ =gUnknown_080D3EE4
_0803F892:
	movs r6, #0
	adds r0, r1, #0
	adds r0, #0x11
	movs r5, #0
	lsls r0, r0, #0x15
	movs r1, #0xc0
	lsls r1, r1, #0xc
	adds r4, r0, r1
	b _0803F8CA
	.align 2, 0
_0803F8A4: .4byte gUnknown_080D3EE4
_0803F8A8:
	ldr r0, _0803F8DC @ =gUnknown_08499598
	ldr r0, [r0]
	adds r0, r5, r0
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r0, r7, r0
	adds r0, #0xc
	lsrs r1, r4, #0x10
	movs r2, #2
	bl sub_0801368C
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r4, r4, r0
	adds r5, #0x3c
	adds r6, #1
_0803F8CA:
	bl sub_08026340
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blt _0803F8A8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F8DC: .4byte gUnknown_08499598

