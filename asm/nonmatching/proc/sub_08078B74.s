	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078B74
sub_08078B74: @ 0x08078B74
	ldr r2, _08078BC0 @ =gUnknown_030030E0
	ldrb r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08078BC4 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08078BC8 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r0, _08078BCC @ =gUnknown_03001FFC
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r0, _08078BD0 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	ldr r2, _08078BD4 @ =gUnknown_030030A4
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	ldr r1, _08078BD8 @ =gUnknown_030030DC
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r2, #1]
	orrs r0, r3
	strb r0, [r2, #1]
	ldrb r0, [r1, #1]
	orrs r0, r3
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08078BC0: .4byte gUnknown_030030E0
_08078BC4: .4byte gUnknown_03002020
_08078BC8: .4byte gUnknown_03002B28
_08078BCC: .4byte gUnknown_03001FFC
_08078BD0: .4byte 0x0000FFE0
_08078BD4: .4byte gUnknown_030030A4
_08078BD8: .4byte gUnknown_030030DC

