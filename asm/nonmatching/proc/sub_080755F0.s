	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080755F0
sub_080755F0: @ 0x080755F0
	push {lr}
	ldr r0, _08075654 @ =gUnknown_081D20AC
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08075658 @ =gUnknown_081D18E8
	ldr r1, _0807565C @ =0x06011480
	bl Decompress
	ldr r2, _08075660 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08075664 @ =gUnknown_03002020
	movs r3, #0
	strh r3, [r0]
	ldr r1, _08075668 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0807566C @ =gUnknown_03001FFC
	strh r3, [r0]
	ldrh r1, [r2]
	ldr r0, _08075670 @ =0x0000FFE0
	ands r0, r1
	ldr r1, _08075674 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _08075678 @ =0x000001DF
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0
_08075654: .4byte gUnknown_081D20AC
_08075658: .4byte gUnknown_081D18E8
_0807565C: .4byte 0x06011480
_08075660: .4byte gUnknown_030030E0
_08075664: .4byte gUnknown_03002020
_08075668: .4byte gUnknown_03002B28
_0807566C: .4byte gUnknown_03001FFC
_08075670: .4byte 0x0000FFE0
_08075674: .4byte 0x0000E0FF
_08075678: .4byte 0x000001DF

