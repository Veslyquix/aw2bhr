	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CEB0
sub_0802CEB0: @ 0x0802CEB0
	push {r4, lr}
	bl sub_0801A168
	ldr r1, _0802CEEC @ =gUnknown_030044B0
	ldr r0, _0802CEF0 @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r1, #8]
	ldr r0, _0802CEF4 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	ldr r4, _0802CEF8 @ =gUnknown_08090BF8
	cmp r0, #0
	beq _0802CED8
	ldr r0, [r4]
	ldrb r2, [r0]
	movs r0, #0xf
	movs r1, #0
	movs r3, #0
	bl sub_08034534
_0802CED8:
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #1
	bl sub_0804438C
	bl sub_08024268
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CEEC: .4byte gUnknown_030044B0
_0802CEF0: .4byte gUnknown_03001FD4
_0802CEF4: .4byte gUnknown_03003FC0
_0802CEF8: .4byte gUnknown_08090BF8

