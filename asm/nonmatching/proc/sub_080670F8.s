	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080670F8
sub_080670F8: @ 0x080670F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0806716C @ =gUnknown_03002B6C
	ldr r1, [r5]
	adds r0, r4, #0
	bl sub_08012C30
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl sub_08012C1C
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl sub_08012C48
	ldr r4, _08067170 @ =gUnknown_03001FE8
	ldr r1, [r5, #0x10]
	adds r0, r4, #0
	bl sub_08012C30
	ldr r1, [r5, #0x14]
	adds r0, r4, #0
	bl sub_08012C1C
	ldr r1, [r5, #0x1c]
	adds r0, r4, #0
	bl sub_08012C48
	ldr r4, _08067174 @ =gUnknown_030030B4
	ldr r1, [r5, #0x20]
	adds r0, r4, #0
	bl sub_08012C30
	ldr r1, [r5, #0x24]
	adds r0, r4, #0
	bl sub_08012C1C
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_08012C48
	ldr r4, _08067178 @ =gUnknown_0300251C
	ldr r1, [r5, #0x30]
	adds r0, r4, #0
	bl sub_08012C30
	ldr r1, [r5, #0x34]
	adds r0, r4, #0
	bl sub_08012C1C
	ldr r1, [r5, #0x3c]
	adds r0, r4, #0
	bl sub_08012C48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806716C: .4byte gUnknown_03002B6C
_08067170: .4byte gUnknown_03001FE8
_08067174: .4byte gUnknown_030030B4
_08067178: .4byte gUnknown_0300251C

