	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054B14
sub_08054B14: @ 0x08054B14
	push {r4, lr}
	movs r1, #0
	ldr r4, _08054B48 @ =gUnknown_03004580
	movs r3, #0
_08054B1C:
	lsls r0, r1, #4
	adds r2, r1, #1
	movs r1, #7
	adds r0, r0, r4
	adds r0, #0xe
_08054B26:
	strh r3, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08054B26
	adds r1, r2, #0
	cmp r1, #1
	ble _08054B1C
	movs r0, #0
	ldr r1, _08054B4C @ =gUnknown_0300450C
	strh r0, [r1]
	ldr r1, _08054B50 @ =gUnknown_03004520
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054B48: .4byte gUnknown_03004580
_08054B4C: .4byte gUnknown_0300450C
_08054B50: .4byte gUnknown_03004520

