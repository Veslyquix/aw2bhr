	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012420
sub_08012420: @ 0x08012420
	push {r4, lr}
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _0801251C @ =gUnknown_030030CC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #4
	ldr r0, _08012520 @ =gUnknown_030020B4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08012524 @ =0x04000010
	ldr r0, _08012528 @ =gUnknown_03001FF8
	ldr r4, _0801252C @ =gUnknown_030030D0
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldr r0, _08012530 @ =gUnknown_03001418
	ldr r3, _08012534 @ =gUnknown_03002B20
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldr r0, _08012538 @ =gUnknown_03002B34
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldr r0, _0801253C @ =gUnknown_03002F18
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldr r0, _08012540 @ =gUnknown_030030A0
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldr r0, _08012544 @ =gUnknown_03001400
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldr r0, _08012548 @ =gUnknown_0300200C
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldr r0, _0801254C @ =gUnknown_03002000
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	ldr r1, _08012550 @ =0x0400004C
	ldr r0, _08012554 @ =gUnknown_030030C4
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x44
	ldr r0, _08012558 @ =gUnknown_03002B6C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0801255C @ =gUnknown_03001FE8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08012560 @ =gUnknown_030030B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08012564 @ =gUnknown_0300251C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x42
	ldr r0, _08012568 @ =gUnknown_030030E0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0801256C @ =0x04000052
	ldr r2, _08012570 @ =gUnknown_03002020
	ldr r0, _08012574 @ =gUnknown_03002B28
	ldrh r1, [r0]
	lsls r1, r1, #8
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, _08012578 @ =0x04000054
	ldr r0, _0801257C @ =gUnknown_03001FFC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08012580 @ =0x04000020
	ldr r1, _08012584 @ =gUnknown_030024D0
	ldr r0, [r1]
	str r0, [r2]
	adds r2, #4
	ldr r0, [r1, #4]
	str r0, [r2]
	adds r2, #4
	ldr r0, [r1, #8]
	str r0, [r2]
	adds r2, #4
	ldr r0, [r1, #0xc]
	str r0, [r2]
	adds r2, #4
	ldr r1, _08012588 @ =gUnknown_03003020
	ldr r0, [r1]
	str r0, [r2]
	adds r2, #4
	ldr r0, [r1, #4]
	str r0, [r2]
	adds r2, #4
	ldr r0, [r1, #8]
	str r0, [r2]
	adds r2, #4
	ldr r0, [r1, #0xc]
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801251C: .4byte gUnknown_030030CC
_08012520: .4byte gUnknown_030020B4
_08012524: .4byte 0x04000010
_08012528: .4byte gUnknown_03001FF8
_0801252C: .4byte gUnknown_030030D0
_08012530: .4byte gUnknown_03001418
_08012534: .4byte gUnknown_03002B20
_08012538: .4byte gUnknown_03002B34
_0801253C: .4byte gUnknown_03002F18
_08012540: .4byte gUnknown_030030A0
_08012544: .4byte gUnknown_03001400
_08012548: .4byte gUnknown_0300200C
_0801254C: .4byte gUnknown_03002000
_08012550: .4byte 0x0400004C
_08012554: .4byte gUnknown_030030C4
_08012558: .4byte gUnknown_03002B6C
_0801255C: .4byte gUnknown_03001FE8
_08012560: .4byte gUnknown_030030B4
_08012564: .4byte gUnknown_0300251C
_08012568: .4byte gUnknown_030030E0
_0801256C: .4byte 0x04000052
_08012570: .4byte gUnknown_03002020
_08012574: .4byte gUnknown_03002B28
_08012578: .4byte 0x04000054
_0801257C: .4byte gUnknown_03001FFC
_08012580: .4byte 0x04000020
_08012584: .4byte gUnknown_030024D0
_08012588: .4byte gUnknown_03003020

