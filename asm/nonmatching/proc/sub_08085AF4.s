	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085AF4
sub_08085AF4: @ 0x08085AF4
	ldr r1, _08085B1C @ =gUnknown_03005990
	movs r2, #0
	adds r0, r1, #0
	adds r0, #8
_08085AFC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08085AFC
	movs r2, #0
	ldr r0, _08085B20 @ =gUnknown_03005900
	strb r2, [r0]
	ldr r1, _08085B24 @ =gUnknown_0300596C
	movs r0, #2
	strh r0, [r1]
	ldr r0, _08085B28 @ =gUnknown_03005980
	strh r2, [r0]
	ldr r0, _08085B2C @ =gUnknown_03005930
	strh r2, [r0]
	bx lr
	.align 2, 0
_08085B1C: .4byte gUnknown_03005990
_08085B20: .4byte gUnknown_03005900
_08085B24: .4byte gUnknown_0300596C
_08085B28: .4byte gUnknown_03005980
_08085B2C: .4byte gUnknown_03005930

