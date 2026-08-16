	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A908
sub_0807A908: @ 0x0807A908
	push {r4, r5, lr}
	ldr r0, _0807A934 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0807A922
	bl sub_08078E14
	cmp r0, #0x21
	beq _0807A922
	bl sub_08078E14
	cmp r0, #0x22
	bne _0807A940
_0807A922:
	ldr r4, _0807A938 @ =gUnknown_030033EC
	ldrb r0, [r4]
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A940
	ldrh r0, [r4]
	b _0807A96A
	.align 2, 0
_0807A934: .4byte gUnknown_03003FC0
_0807A938: .4byte gUnknown_030033EC
_0807A93C:
	adds r0, r4, #0
	b _0807A96A
_0807A940:
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #0x11
	b _0807A95C
_0807A948:
	adds r4, #1
	lsrs r0, r5, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A93C
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
_0807A95C:
	bl sub_080248F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0807A948
	movs r0, #0
_0807A96A:
	pop {r4, r5}
	pop {r1}
	bx r1

