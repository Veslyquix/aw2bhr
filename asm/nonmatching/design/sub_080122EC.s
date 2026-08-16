	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080122EC
sub_080122EC: @ 0x080122EC
	ldr r0, _08012324 @ =gUnknown_03001FF8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08012328 @ =gUnknown_03001418
	strh r1, [r0]
	ldr r0, _0801232C @ =gUnknown_03002B34
	strh r1, [r0]
	ldr r0, _08012330 @ =gUnknown_03002F18
	strh r1, [r0]
	ldr r0, _08012334 @ =gUnknown_030030A0
	strh r1, [r0]
	ldr r0, _08012338 @ =gUnknown_03001400
	strh r1, [r0]
	ldr r0, _0801233C @ =gUnknown_0300200C
	strh r1, [r0]
	ldr r0, _08012340 @ =gUnknown_03002000
	strh r1, [r0]
	ldr r0, _08012344 @ =gUnknown_030030C4
	strh r1, [r0]
	ldr r0, _08012348 @ =gUnknown_03002B6C
	strh r1, [r0]
	ldr r0, _0801234C @ =gUnknown_03001FE8
	strh r1, [r0]
	ldr r0, _08012350 @ =gUnknown_030030B4
	strh r1, [r0]
	ldr r0, _08012354 @ =gUnknown_0300251C
	strh r1, [r0]
	bx lr
	.align 2, 0
_08012324: .4byte gUnknown_03001FF8
_08012328: .4byte gUnknown_03001418
_0801232C: .4byte gUnknown_03002B34
_08012330: .4byte gUnknown_03002F18
_08012334: .4byte gUnknown_030030A0
_08012338: .4byte gUnknown_03001400
_0801233C: .4byte gUnknown_0300200C
_08012340: .4byte gUnknown_03002000
_08012344: .4byte gUnknown_030030C4
_08012348: .4byte gUnknown_03002B6C
_0801234C: .4byte gUnknown_03001FE8
_08012350: .4byte gUnknown_030030B4
_08012354: .4byte gUnknown_0300251C

