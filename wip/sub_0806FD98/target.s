	thumb_func_start sub_0806FD98
sub_0806FD98: @ 0x0806FD98
	ldr r0, _08070044 @ =gUnknown_03007FF0
	ldr r0, [r0]
	ldr r2, _08070048 @ =0x68736D53
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _0806FDD8
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _0806FDD8
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _0806FDDC @ =0x040000BC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _0806FDBE
	ldr r1, _0806FDE0 @ =0x84400004
	str r1, [r2, #8]
_0806FDBE:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _0806FDC8
	ldr r1, _0806FDE0 @ =0x84400004
	str r1, [r2, #0x14]
_0806FDC8:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
_0806FDCE:
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_0806FDD8:
	bx lr
	.align 2, 0
_0806FDDC: .4byte 0x040000BC
_0806FDE0: .4byte 0x84400004

