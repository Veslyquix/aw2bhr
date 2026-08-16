	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041128
sub_08041128: @ 0x08041128
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl sub_08042DE0
	ldr r1, _08041170 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r4, [r1, #0x1a]
	ldr r1, _08041174 @ =gUnknown_0849FD6C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08041178 @ =0x06014940
	bl Decompress
	ldr r0, _0804117C @ =gUnknown_081213F4
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r5, #0x10
	lsls r5, r5, #0x15
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08041170: .4byte gUnknown_08499598
_08041174: .4byte gUnknown_0849FD6C
_08041178: .4byte 0x06014940
_0804117C: .4byte gUnknown_081213F4

