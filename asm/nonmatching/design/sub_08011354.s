	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011354
sub_08011354: @ 0x08011354
	ldr r0, _0801136C @ =gUnknown_03002B40
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08011370 @ =gUnknown_03002EFC
	strb r1, [r0]
	ldr r1, _08011374 @ =gUnknown_03002B4C
	movs r0, #0xf0
	strb r0, [r1]
	ldr r1, _08011378 @ =gUnknown_03002B44
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0801136C: .4byte gUnknown_03002B40
_08011370: .4byte gUnknown_03002EFC
_08011374: .4byte gUnknown_03002B4C
_08011378: .4byte gUnknown_03002B44

