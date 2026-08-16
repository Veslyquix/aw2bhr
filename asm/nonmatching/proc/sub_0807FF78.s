	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FF78
sub_0807FF78: @ 0x0807FF78
	ldr r0, _0807FFB4 @ =gUnknown_081D937C
	ldr r2, [r0]
	ldrh r1, [r2]
	adds r3, r0, #0
	cmp r1, #0xf
	bhi _0807FF9E
	ldr r0, _0807FFB8 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0807FF9E
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	ldr r1, _0807FFBC @ =gUnknown_03002B28
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807FF9E:
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807FFC8
	ldr r2, _0807FFC0 @ =gUnknown_030030E0
	ldrh r1, [r2]
	ldr r0, _0807FFC4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #5
	b _0807FFD4
	.align 2, 0
_0807FFB4: .4byte gUnknown_081D937C
_0807FFB8: .4byte gUnknown_03004008
_0807FFBC: .4byte gUnknown_03002B28
_0807FFC0: .4byte gUnknown_030030E0
_0807FFC4: .4byte 0x0000E0FF
_0807FFC8:
	ldr r2, _0807FFE4 @ =gUnknown_030030E0
	ldrh r1, [r2]
	ldr r0, _0807FFE8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #4
_0807FFD4:
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0807FFEC @ =gUnknown_03001FF8
	ldrh r0, [r1]
	adds r0, #0x18
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807FFE4: .4byte gUnknown_030030E0
_0807FFE8: .4byte 0x0000E0FF
_0807FFEC: .4byte gUnknown_03001FF8

