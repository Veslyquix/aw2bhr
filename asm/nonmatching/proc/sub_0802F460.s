	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F460
sub_0802F460: @ 0x0802F460
	ldr r1, _0802F478 @ =gUnknown_0849B018
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0802F47C
	movs r0, #0
	b _0802F47E
	.align 2, 0
_0802F478: .4byte gUnknown_0849B018
_0802F47C:
	movs r0, #1
_0802F47E:
	bx lr

