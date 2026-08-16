	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072C40
sub_08072C40: @ 0x08072C40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #1
	beq _08072C78
	cmp r0, #1
	bgt _08072C5C
	cmp r0, #0
	beq _08072C66
	b _08072CA0
_08072C5C:
	cmp r3, #2
	beq _08072C88
	cmp r3, #3
	beq _08072C98
	b _08072CA0
_08072C66:
	ldr r0, _08072C70 @ =gUnknown_03001FF8
	strh r1, [r0]
	ldr r0, _08072C74 @ =gUnknown_03001418
	b _08072C9E
	.align 2, 0
_08072C70: .4byte gUnknown_03001FF8
_08072C74: .4byte gUnknown_03001418
_08072C78:
	ldr r0, _08072C80 @ =gUnknown_03002B34
	strh r1, [r0]
	ldr r0, _08072C84 @ =gUnknown_03002F18
	b _08072C9E
	.align 2, 0
_08072C80: .4byte gUnknown_03002B34
_08072C84: .4byte gUnknown_03002F18
_08072C88:
	ldr r0, _08072C90 @ =gUnknown_030030A0
	strh r1, [r0]
	ldr r0, _08072C94 @ =gUnknown_03001400
	b _08072C9E
	.align 2, 0
_08072C90: .4byte gUnknown_030030A0
_08072C94: .4byte gUnknown_03001400
_08072C98:
	ldr r0, _08072CA4 @ =gUnknown_0300200C
	strh r1, [r0]
	ldr r0, _08072CA8 @ =gUnknown_03002000
_08072C9E:
	strh r2, [r0]
_08072CA0:
	bx lr
	.align 2, 0
_08072CA4: .4byte gUnknown_0300200C
_08072CA8: .4byte gUnknown_03002000

