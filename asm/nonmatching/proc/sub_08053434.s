	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053434
sub_08053434: @ 0x08053434
	ldr r1, _0805347C @ =gUnknown_03004570
	ldr r0, _08053480 @ =gUnknown_03001FBC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08053484 @ =gUnknown_03004530
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08053488 @ =gUnknown_03004544
	strh r1, [r0]
	ldr r3, _0805348C @ =gUnknown_030045A4
	ldr r2, _08053490 @ =gUnknown_085537F4
	ldr r1, _08053494 @ =gUnknown_03004580
	ldrh r0, [r1, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	ldrh r0, [r1, #0x1a]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #2]
	ldr r3, _08053498 @ =gUnknown_03004510
	ldr r2, _0805349C @ =gUnknown_0855380A
	ldrh r0, [r1, #0xa]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	ldrh r0, [r1, #0x1a]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #2]
	bx lr
	.align 2, 0
_0805347C: .4byte gUnknown_03004570
_08053480: .4byte gUnknown_03001FBC
_08053484: .4byte gUnknown_03004530
_08053488: .4byte gUnknown_03004544
_0805348C: .4byte gUnknown_030045A4
_08053490: .4byte gUnknown_085537F4
_08053494: .4byte gUnknown_03004580
_08053498: .4byte gUnknown_03004510
_0805349C: .4byte gUnknown_0855380A

