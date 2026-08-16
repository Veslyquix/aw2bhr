	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801237C
sub_0801237C: @ 0x0801237C
	ldr r2, _080123C0 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080123C4 @ =gUnknown_03002B40
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080123C8 @ =gUnknown_03002B4C
	strb r1, [r0]
	ldr r0, _080123CC @ =gUnknown_03002EFC
	strb r1, [r0]
	ldr r0, _080123D0 @ =gUnknown_03002B44
	strb r1, [r0]
	ldr r0, _080123D4 @ =gUnknown_03002B68
	strb r1, [r0]
	ldr r0, _080123D8 @ =gUnknown_030024E4
	strb r1, [r0]
	ldr r0, _080123DC @ =gUnknown_03002B30
	strb r1, [r0]
	ldr r0, _080123E0 @ =gUnknown_030020B8
	strb r1, [r0]
	ldr r0, _080123E4 @ =gUnknown_030030A4
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080123E8 @ =gUnknown_030030DC
	strh r1, [r0]
	bx lr
	.align 2, 0
_080123C0: .4byte gUnknown_030030CC
_080123C4: .4byte gUnknown_03002B40
_080123C8: .4byte gUnknown_03002B4C
_080123CC: .4byte gUnknown_03002EFC
_080123D0: .4byte gUnknown_03002B44
_080123D4: .4byte gUnknown_03002B68
_080123D8: .4byte gUnknown_030024E4
_080123DC: .4byte gUnknown_03002B30
_080123E0: .4byte gUnknown_030020B8
_080123E4: .4byte gUnknown_030030A4
_080123E8: .4byte gUnknown_030030DC

